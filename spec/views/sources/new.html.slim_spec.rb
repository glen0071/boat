# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'sources/new', type: :view do
  before(:each) do
    assign(:source, Source.new(
                      name: 'MyString',
                      author: nil,
                      pub_date: 'MyString'
                    ))
  end

  it 'renders new source form' do
    render

    assert_select 'form[action=?][method=?]', sources_path, 'post' do
      assert_select 'input[name=?]', 'source[name]'

      assert_select 'input[name=?]', 'source[author_id]'

      assert_select 'input[name=?]', 'source[pub_date]'
    end
  end
end
