require 'rails_helper'

RSpec.describe 'moo_tasks/index', type: :view do
  before(:each) do
    assign(:moo_tasks, [
             MooTask.create!(
               name: 'Name',
               status: 'Status',
               notes: 'Notes'
             ),
             MooTask.create!(
               name: 'Name',
               status: 'Status',
               notes: 'Notes'
             )
           ])
  end

  it 'renders a list of moo_tasks' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: 'Status'.to_s, count: 2
    assert_select 'tr>td', text: 'Notes'.to_s, count: 2
  end
end
