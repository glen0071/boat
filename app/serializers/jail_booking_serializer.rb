class JailBookingSerializer < ActiveModel::Serializer
  attributes :id, :number, :full_name, :age, :inmate_number, :custody_status, :housing_location, :received_date_time, :arrested_by, :released_date_tiem, :city, :state
end
