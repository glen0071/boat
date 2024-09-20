# frozen_string_literal: true

class HennepinJailScraperService
  def scrape
    browser = Ferrum::Browser.new(
      headless: true,
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
    sleep(1)

    # gather cds-button elements
    cds_buttons_array = browser.css('cds-button')

    # iterate over cds-button elements to find clients
    client_info_buttons_array = cds_buttons_array.select { |cds| cds if cds.text.to_i > 1 }

    client_info_buttons_array.each do |button|
      button.evaluate('this.scrollIntoView()')
      button.click
      close_button = browser.at_xpath('/html/body/jr-root/jr-jail-roster-details/cds-modal/cds-modal-actions/cds-button')
      client_info_nodes_array = browser.css('hcso-read-only-element')
      @client_info_array = client_info_nodes_array.map(&:text)
      booking_number = parse_booking_detail('Booking Number: ', /(Booking Number: )(\d+)/).to_i
      jail_booking = JailBooking.find_or_create_by(booking_number:)
      # puts booking_number

      close_button.click
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
