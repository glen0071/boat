class CreateJailBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :jail_bookings do |t|
      t.string :booking_number
      t.string :full_name
      t.integer :age_at_booking
      t.string :inmate_number
      t.string :custody_status
      t.string :housing_location
      t.datetime :received_date_time
      t.string :arrested_by
      t.datetime :released_date_time
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
