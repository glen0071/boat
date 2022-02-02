require 'rails_helper'

RSpec.describe "moo_tasks/new", type: :view do
  before(:each) do
    assign(:moo_task, MooTask.new(
      name: "MyString",
      status: "MyString",
      notes: "MyString"
    ))
  end

  it "renders new moo_task form" do
    render

    assert_select "form[action=?][method=?]", moo_tasks_path, "post" do

      assert_select "input[name=?]", "moo_task[name]"

      assert_select "input[name=?]", "moo_task[status]"

      assert_select "input[name=?]", "moo_task[notes]"
    end
  end
end
