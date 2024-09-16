require 'rails_helper'

RSpec.describe "jail_bookings/index", type: :view do
  before(:each) do
    assign(:jail_bookings, [
      JailBooking.create!(
        number: "Number",
        full_name: "Full Name",
        age: 2,
        inmate_number: "Inmate Number",
        custody_status: "Custody Status",
        housing_location: "Housing Location",
        arrested_by: "Arrested By",
        city: "City",
        state: "State"
      ),
      JailBooking.create!(
        number: "Number",
        full_name: "Full Name",
        age: 2,
        inmate_number: "Inmate Number",
        custody_status: "Custody Status",
        housing_location: "Housing Location",
        arrested_by: "Arrested By",
        city: "City",
        state: "State"
      )
    ])
  end

  it "renders a list of jail_bookings" do
    render
    assert_select "tr>td", text: "Number".to_s, count: 2
    assert_select "tr>td", text: "Full Name".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "Inmate Number".to_s, count: 2
    assert_select "tr>td", text: "Custody Status".to_s, count: 2
    assert_select "tr>td", text: "Housing Location".to_s, count: 2
    assert_select "tr>td", text: "Arrested By".to_s, count: 2
    assert_select "tr>td", text: "City".to_s, count: 2
    assert_select "tr>td", text: "State".to_s, count: 2
  end
end
