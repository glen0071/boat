class CarceralDataController < ApplicationController
  def hennepin
    @last_scraped_page_hennepin = LastScrapedPage.last&.page_number
    @jail_bookings_count = JailBooking.count
    @in_custody_now = JailBooking.where(custody_status: 'Currently in Jail/Custody').count

    @arrested_by_rankings = JailBooking.group(:arrested_by).count.sort_by { |_key, value| -value }.take(10)

    @charges = CaseCharge.group(:description).count.sort_by { |_key, value| -value }.take(10)

    @charge_severity = CaseCharge.group(:severity_of_charge).count.sort_by { |_key, value| -value }

    @posted_bail_descriptions = HoldingCase.where(clear_reason: 'BAIL POSTED').map do |hc|
      hc.case_charges.first.description
    end

    @jailable_crimes
  end

  def hennepin_bail_amounts
    @bail_amounts = HoldingCase.where.not(bail_options: nil).group(:bail_options).count.sort_by { |_key, value| -value }

    @empty_bail_options = HoldingCase.where(bail_options: nil).count

    all_bookings = JailBooking.includes(:holding_cases).all

    nbr_amount = all_bookings.select { |jb| jb.bail_required_on_booking? == false }.count

    not_nbr_amount = all_bookings.count - nbr_amount

    @nbr_amount = [['No Bail Required', nbr_amount], ['Bail Required', not_nbr_amount]]
  end
end
