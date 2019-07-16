require 'rails_helper'

RSpec.describe "subjects/index", type: :view do
  before(:each) do
    assign(:subjects, [
      Subject.create!(
        :name => "Name",
        :description => "MyText"
      ),
      Subject.create!(
        :name => "Name",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of subjects" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
