class CarceralDataController < ApplicationController
  def hennepin
    @jail_bookings_count = JailBooking.count
    @in_custody_now = JailBooking.where(custody_status: 'Currently in Jail/Custody').count
  end
end
