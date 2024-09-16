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
      close_buton = browser.at_xpath('/html/body/jr-root/jr-jail-roster-details/cds-modal/cds-modal-actions/cds-button')

      # gather all the info
      client_info_nodes_array = browser.css('hcso-read-only-element')

      # Create JailBooking by booking_number
      client_info_array = client_info_nodes_array.map { |detail| detail.text }
      booking_number_string = client_info_array.find { |detail| detail.match?('Booking Number: ') }
      booking_number = booking_number_string.match(/(Booking Number: )(\d+)/)[2]
      booking = JailBooking.find_or_create_by(booking_number:)

      age_string = client_info_array.find { |detail| detail.match?('Age: ') }
      age_at_booking = age_string.match(/(Age: )(\d+)/)[2].to_i

      inmate_number_string = client_info_array.find { |detail| detail.match?('Inmate Number: ') }
      inmate_number = inmate_number_string.match(/(Age: )(\d+)/)[2].to_i

      custody_status_string = client_info_array.find { |detail| detail.match?('Custody Status: ') }
      custody_status = custody_status_string.match(/(Custody Status: )(.*)\b/)[2]

      arrested_by_string = client_info_array.find { |detail| detail.match?('Custody Status: ') }
      arrested_by = arrested_by_string.match(/(Arrested By: )(.*)\b/)[2]

      full_name_string = client_info_array.find { |detail| detail.match?('Custody Status: ') }
      full_name = full_name_string.match(/(Full Name: )(.*)\b/)[2]

      housing_location_string = client_info_array.find { |detail| detail.match?('Custody Status: ') }
      housing_location = housing_location_string.match(/(Housing Location: )(.*)\b/)[2]

      city_string = client_info_array.find { |detail| detail.match?('Custody Status: ') }
      city = city_string.match(/(City: )(.*)\b/)[2]

      state_string = client_info_array.find { |detail| detail.match?('Custody Status: ') }
      state = state_string.match(/(State: )(.*)\b/)[2]

      received_date_time_string = client_info_array.find { |detail| detail.match?('Received Date/Time: ') }
      received_date_time_unparsed = received_date_time_string.match(%r{(Received Date/Time: )(.*)\b})[2]
      received_date_time = DateTime.parse(received_date_time_unparsed)

      released_date_time_string = client_info_array.find { |detail| detail.match?('Received Date/Time: ') }
      released_date_time_unparsed = released_date_time_string.match(%r{(Received Date/Time: )(.*)\b})[2]
      released_date_time = DateTime.parse(released_date_time_unparsed)

      booking.update(
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
      end

      # get details on warranted cases
      holding_cases = browser.css('jr-case-detail')
      holding_cases.each do |holding_case|
        details_string = holding_case.text 
        details_string


        # find MNCIS number
        mncis_number = details_string.match(/(MNCIS Case#:)\s*(27\S+)/)[2]

        # To prevent conflicts, use mncis # as UID?
        # Later may want to implement to show changes over time on this page
        # But first just fill out past data
        
        holding_case = HoldingCase.find_or_create_by(mncis_number:)
      end

      close_buton.click
    end

    content = browser.body
    puts content
    browser.quit
    # Extract desired data from the HTML document
    # ...
  end
end

# ["Full Name: AASHEIM, DEREK HARLAN ",
#  "Booking Number: 2024039290 ",
#  "Age: 22 ",
#  "Inmate Number: 202410301 ",
#  "Custody Status: Released from Custody ",
#  "Housing Location:  ",
#  "Received Date/Time: Jul 24, 2024, 1:24:56 AM ",
#  "Arrested By: MN STATE PATROL WEST ",
#  "Released Date/Time: Jul 24, 2024, 6:03:12 AM ",
#  "City: ARIZONA CITY ",
#  "State: AZ ",
#  "Case Type: TAB CHARGE ",
#  "MNCIS Case#: 27CR2416679 ",
#  "Charged By: MN STATE PATROL WEST ",
#  "Clear Reason: BAIL POSTED ",
#  "Hold Without Bail:",
#  "Bail Options:$1,000.00 BAIL/BOND W/O CR$150.00 CASH BAIL W/O CR",
#  "Next Court Appearance:",
#  "Description: TRAFFIC - DWI - OPERATE MOTOR VEHICLE UNDER INFLUENCE OF ALCOHOL ",
#  "Severity of Charge: Misdemeanor ",
#  "Statute: 169A.20.1(1) ",
#  "Charge Status:  "]
