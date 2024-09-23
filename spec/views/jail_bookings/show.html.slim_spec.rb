require 'rails_helper'

RSpec.describe 'jail_bookings/show', type: :view do
  before(:each) do
    @jail_booking = assign(:jail_booking, JailBooking.create!(
                                            number: 'Number',
                                            full_name: 'Full Name',
                                            age: 2,
                                            inmate_number: 'Inmate Number',
                                            custody_status: 'Custody Status',
                                            housing_location: 'Housing Location',
                                            arrested_by: 'Arrested By',
                                            city: 'City',
                                            state: 'State'
                                          ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Number/)
    expect(rendered).to match(/Full Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Inmate Number/)
    expect(rendered).to match(/Custody Status/)
    expect(rendered).to match(/Housing Location/)
    expect(rendered).to match(/Arrested By/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
  end
end
