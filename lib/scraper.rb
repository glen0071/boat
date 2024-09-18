# frozen_string_literal: true

class Scraper
  def scrape
    browser = Ferrum::Browser.new(headless: false)
    browser.go_to('https://jailroster.hennepin.us/')
    browser.network.wait_for_idle

    # gather cds-button elements
    cds_buttons_array = browser.css('cds-button')

    # iterate over cds-button elements to find clients
    client_info_buttons_array = cds_buttons_array.select { |cds| cds if cds.text.to_i > 1 }

    client_info_buttons_array.each do |button|
      button.evaluate('this.scrollIntoView()')
      button.click

      # assuming client modal open
      close_button = browser.at_xpath('/html/body/jr-root/jr-jail-roster-details/cds-modal/cds-modal-actions/cds-button')

      # gather client info
      client_info_nodes_array = browser.css('hcso-read-only-element')

      # Create JailBooking by booking_number
      @client_info_array = client_info_nodes_array.map(&:text)
      booking_number = parse_booking_detail('Booking Number: ', /(Booking Number: )(\d+)/).to_i
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

      @client_info_array.each do |client_info|
        client_info
      end

      # gather details on warranted cases
      holding_cases = browser.css('jr-case-detail')
      holding_cases.each do |holding_case|
        details_string = holding_case.text

        # find MNCIS number
        mncis_number = details_string.match(/(MNCIS Case#:)\s*(27\S+)/)[2]
        case_type = details_string.match(/(Case Type:)\s*(27\S+)/)[2]

        details_string

        # To prevent conflicts, use mncis # as UID?
        # Later may want to implement to show changes over time on this page
        # But first just fill out past data
        # What abour PC holds with no MNCIS number?

        holding_case = HoldingCase.find_or_create_by(mncis_number:, jail_booking:)

        state_string = client_info_array.find { |detail| detail.match?('Custody Status: ') }
        state = state_string.match(/(State: )(.*)\b/)[2]

        close_button.click
      end
    end

    browser.quit
  end

  def parse_booking_detail(string_parse_pattern, regex_parse_pattern)
    detail_string = @client_info_array.find { |detail| detail.match?(string_parse_pattern) }
    @client_info_array.delete(detail_string)
    return nil if detail_string.match(regex_parse_pattern).nil?

    detail_string.match(regex_parse_pattern)[2]
  end
end
