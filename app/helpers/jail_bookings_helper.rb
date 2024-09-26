module JailBookingsHelper
  def how_long_in(jail_booking)
    start_time = jail_booking.received_date_time&.to_datetime
    end_time = jail_booking.released_date_time&.to_datetime || DateTime.now
    (end_time - start_time).to_i
  end
end
