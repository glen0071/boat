# frozen_string_literal: true

class HennepinJailScraperService
  def scrape
    browser = Ferrum::Browser.new(
      headless: false,
      browser_path: ENV.fetch('GOOGLE_CHROME_SHIM', nil),
      args: %w[
        no-sandbox
        disable-gpu
        disable-dev-shm-usage
        disable-software-rasterizer
      ]
    )

    browser.go_to('https://jailroster.hennepin.us/')
    browser.network.wait_for_idle
    sleep(0.4)

    # orient for page navigation
    current_page_node = browser.at_xpath('/html/body/jr-root/hcso-content/main/jr-jail-roster/jr-jail-roster-search/hcso-data-result-container/hcso-pagination/cds-pagination/cds-input/input')
    current_page = current_page_node.value
    total_pages_node = browser.at_xpath('/html/body/jr-root/hcso-content/main/jr-jail-roster/jr-jail-roster-search/hcso-data-result-container/hcso-pagination/cds-pagination/cds-input/cds-control-message')
    total_pages = total_pages_node.text.scan(/\d+/).first

    arrow_next_clients = browser.at_xpath('/html/body/jr-root/hcso-content/main/jr-jail-roster/jr-jail-roster-search/hcso-data-result-container/hcso-pagination/cds-pagination/cds-pagination-button[3]')
    while current_page.to_i < total_pages.to_i
      # gather cds-button elements
      cds_buttons_array = browser.css('cds-button')
      booking_number_buttons_array = cds_buttons_array.select { |cds| cds if cds.text.to_i > 1 }

      # iterate over cds-button elements to find clients
      booking_number_buttons_array.each do |button|
        button.evaluate('this.scrollIntoView()')
        button.click
        sleep(0.1)

        close_button = browser.at_xpath('/html/body/jr-root/jr-jail-roster-details/cds-modal/cds-modal-actions/cds-button')
        client_info_nodes_array = browser.css('hcso-read-only-element')
        @client_info_array = client_info_nodes_array.map(&:text)
        # puts @client_info_array[3]
        booking_number = parse_booking_detail('Booking Number: ', /(Booking Number: )(\d+)/).to_i
        return if booking_number == 0

        jail_booking = JailBooking.find_or_create_by(booking_number:)

        # Parse jail booking info
        age_at_booking = parse_booking_detail('Age: ', /(Age: )(\d+)/).to_i
        inmate_number = parse_booking_detail('Inmate Number: ', /(Inmate Number: )(\d+)/).to_i
        custody_status = parse_booking_detail('Custody Status: ', /(Custody Status: )(.*)\b/)
        arrested_by = parse_booking_detail('Arrested By: ', /(Arrested By: )(.*)\b/)
        full_name = parse_booking_detail('Full Name: ', /(Full Name: )(.*)\b/)
        housing_location = parse_booking_detail('Housing Location: ', /(Housing Location: )(.*)\b/)
        city = parse_booking_detail('City: ', /(City: )(.*)\b/)
        state = parse_booking_detail('State: ', /(State: )(.*)\b/)
        received_date_time_string = parse_booking_detail('Received Date/Time: ', %r{(Received Date/Time: )(.*)\b})
        received_date_time = DateTime.parse(received_date_time_string)
        released_date_time_string = parse_booking_detail('Released Date/Time: ', %r{(Released Date/Time: )(.*)\b})
        released_date_time = released_date_time_string.nil? ? released_date_time_string : DateTime.parse(released_date_time_string)

        jail_booking.update(
          full_name:,
          age_at_booking:,
          inmate_number:,
          custody_status:,
          arrested_by:,
          city:,
          state:,
          received_date_time:,
          released_date_time:,
          housing_location:
        )

        close_button.click
      end

      arrow_next_clients.click
      sleep(0.6)
    end

    browser.quit
  end

  private

  def parse_booking_detail(string_parse_pattern, regex_parse_pattern)
    detail_string = @client_info_array.find { |detail| detail.match?(string_parse_pattern) }
    return nil if detail_string.nil?

    @client_info_array.delete(detail_string)
    return nil if detail_string.match(regex_parse_pattern).nil?

    detail_string.match(regex_parse_pattern)[2]
  end
end
