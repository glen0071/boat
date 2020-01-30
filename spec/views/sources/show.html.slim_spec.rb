# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'sources/show', type: :view do
  before(:each) do
    @source = assign(:source, Source.create!(
                                name: 'Name',
                                author: nil,
                                pub_date: 'Pub Date'
                              ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Pub Date/)
  end
end
