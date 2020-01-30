# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'sources/index', type: :view do
  before(:each) do
    assign(:sources, [
             Source.create!(
               name: 'Name',
               author: nil,
               pub_date: 'Pub Date'
             ),
             Source.create!(
               name: 'Name',
               author: nil,
               pub_date: 'Pub Date'
             )
           ])
  end

  it 'renders a list of sources' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: 'Pub Date'.to_s, count: 2
  end
end
