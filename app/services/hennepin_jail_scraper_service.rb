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

        charge_number = 0
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

        holding_cases_open_struct_array = []
        case_charges_array = []
        # gather and organize case data
        @client_info_array.each do |client_info_node|
          case client_info_node
          when /Case Type:\s*(.*)\b/
            holding_cases_open_struct_array << OpenStruct.new(jail_booking_id: jail_booking.id)
            holding_cases_open_struct_array.last.case_type = client_info_node.match(/Case Type:\s*(.*)\b/)[1]

            # throwing this in under Case Type
            vector_shape = browser.at_xpath('/html/body/jr-root/jr-jail-roster-details/cds-modal/cds-modal-content/jr-case-detail/hcso-detail-card/div/div/hcso-body/hcso-read-only-form/cds-form-group/div/div[2]/hcso-read-only-element[1]/cds-control/p/cds-icon').attribute('shape')
            holding_cases_open_struct_array.last.hold_without_bail = vector_shape == 'check'
          when /MNCIS Case#:\s*(\w+)\b/
            holding_cases_open_struct_array.last.mncis_number = client_info_node.match(/MNCIS Case#:\s*(\w+)\b/)[1]
          when /Charged By:\s*(.*)\b/
            holding_cases_open_struct_array.last.charged_by = client_info_node.match(/Charged By:\s*(.*)\b/)[1]
          when /Clear Reason:\s*(.*)\b/
            holding_cases_open_struct_array.last.clear_reason = client_info_node.match(/Clear Reason:\s*(.*)\b/)[1]
          when /Bail Options:\s*(.*)\b/
            holding_cases_open_struct_array.last.bail_options = client_info_node.match(/Bail Options:\s*(.*)\b/)[1]
          when /Next Court Appearance:\s*(.*)\b/
            holding_cases_open_struct_array.last.next_court_appearance = client_info_node.match(/Next Court Appearance:\s*(.*)\b/)[1]
          when /Description:\s*(.*)\b/

            # If we reach description, assume we rounded out a holding_case
            # find and create by booking # and mncis_number in case mncis_number is nil for PC hold
            new_holding_case = holding_cases_open_struct_array.last
            holding_case = HoldingCase.find_or_create_by(jail_booking_id: new_holding_case.jail_booking_id,
                                                         mncis_number: new_holding_case.mncis_number)
            holding_case.update(new_holding_case.to_h)
            charge_number += 1

            case_charges_array << CaseCharge.find_or_initialize_by(charge_number:, holding_case:)
            case_charges_array.last.description = client_info_node.match(/Description:\s*(.*)/)[1]
          when /Severity of Charge:\s*(.*)\b/
            case_charges_array.last.severity_of_charge = client_info_node.match(/Severity of Charge:\s*(.*)/)[1]
          when /Statute:\s*(.*)\b/
            case_charges_array.last.statute = client_info_node.match(/Statute:\s*(.*)/)[1]
          when /Charge Status:\s*(.*)\b/
            case_charges_array.last.charge_status = client_info_node.match(/Charge Status:\s*(.*)/)[1]
          end
        end

        case_charges_array.each(&:save)

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
    return nil if detail_string.nil? || detail_string.match(regex_parse_pattern).nil?

    detail_string.match(regex_parse_pattern)[2]
  end
end
