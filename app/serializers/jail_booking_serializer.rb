class JailBookingSerializer < ActiveModel::Serializer
  attributes :id, :number, :full_name, :age_at_booking, :inmate_number, :custody_status, :housing_location, :received_date_time,
             :arrested_by, :released_date_time, :city, :state
end
