require 'rails_helper'

RSpec.describe "sources/edit", type: :view do
  before(:each) do
    @source = assign(:source, Source.create!(
      :name => "MyString",
      :author => nil,
      :pub_date => "MyString"
    ))
  end

  it "renders the edit source form" do
    render

    assert_select "form[action=?][method=?]", source_path(@source), "post" do

      assert_select "input[name=?]", "source[name]"

      assert_select "input[name=?]", "source[author_id]"

      assert_select "input[name=?]", "source[pub_date]"
    end
  end
end
