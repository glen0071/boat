require 'rails_helper'

RSpec.describe "jail_bookings/new", type: :view do
  before(:each) do
    assign(:jail_booking, JailBooking.new(
      number: "MyString",
      full_name: "MyString",
      age: 1,
      inmate_number: "MyString",
      custody_status: "MyString",
      housing_location: "MyString",
      arrested_by: "MyString",
      city: "MyString",
      state: "MyString"
    ))
  end

  it "renders new jail_booking form" do
    render

    assert_select "form[action=?][method=?]", jail_bookings_path, "post" do

      assert_select "input[name=?]", "jail_booking[number]"

      assert_select "input[name=?]", "jail_booking[full_name]"

      assert_select "input[name=?]", "jail_booking[age]"

      assert_select "input[name=?]", "jail_booking[inmate_number]"

      assert_select "input[name=?]", "jail_booking[custody_status]"

      assert_select "input[name=?]", "jail_booking[housing_location]"

      assert_select "input[name=?]", "jail_booking[arrested_by]"

      assert_select "input[name=?]", "jail_booking[city]"

      assert_select "input[name=?]", "jail_booking[state]"
    end
  end
end
