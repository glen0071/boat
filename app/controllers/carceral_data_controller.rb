class CarceralDataController < ApplicationController
  def hennepin
    @last_scraped_page_hennepin = LastScrapedPage.last&.page_number
    @jail_bookings_count = JailBooking.count
    @in_custody_now = JailBooking.where(custody_status: 'Currently in Jail/Custody').count

    @arrested_by_rankings = JailBooking.group(:arrested_by).count.sort_by { |_key, value| -value }

    @bail_amounts = HoldingCase.group(:bail_options).count.sort_by { |_key, value| -value }

    @posted_bail_descriptions = HoldingCase.where(clear_reason: 'BAIL POSTED').map do |hc|
      hc.case_charges.first.description
    end

    @jailable_crimes
  end
end
