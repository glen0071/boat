require 'rails_helper'

RSpec.describe "moo_tasks/edit", type: :view do
  before(:each) do
    @moo_task = assign(:moo_task, MooTask.create!(
      name: "MyString",
      status: "MyString",
      notes: "MyString"
    ))
  end

  it "renders the edit moo_task form" do
    render

    assert_select "form[action=?][method=?]", moo_task_path(@moo_task), "post" do

      assert_select "input[name=?]", "moo_task[name]"

      assert_select "input[name=?]", "moo_task[status]"

      assert_select "input[name=?]", "moo_task[notes]"
    end
  end
end
