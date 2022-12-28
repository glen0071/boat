require 'rails_helper'

RSpec.describe 'moo_tasks/show', type: :view do
  before(:each) do
    @moo_task = assign(:moo_task, MooTask.create!(
                                    name: 'Name',
                                    status: 'Status',
                                    notes: 'Notes'
                                  ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/Notes/)
  end
end
