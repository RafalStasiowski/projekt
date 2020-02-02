require 'rails_helper'

RSpec.describe "delivers/new", type: :view do
  before(:each) do
    assign(:deliver, Deliver.new(
      :id => 1,
      :name => "MyString",
      :car => "MyString",
      :phone => 1
    ))
  end

  it "renders new deliver form" do
    render

    assert_select "form[action=?][method=?]", delivers_path, "post" do

      assert_select "input#deliver_id[name=?]", "deliver[id]"

      assert_select "input#deliver_name[name=?]", "deliver[name]"

      assert_select "input#deliver_car[name=?]", "deliver[car]"

      assert_select "input#deliver_phone[name=?]", "deliver[phone]"
    end
  end
end
