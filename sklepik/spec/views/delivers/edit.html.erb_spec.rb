require 'rails_helper'

RSpec.describe "delivers/edit", type: :view do
  before(:each) do
    @deliver = assign(:deliver, Deliver.create!(
      :id => 1,
      :name => "MyString",
      :car => "MyString",
      :phone => 1
    ))
  end

  it "renders the edit deliver form" do
    render

    assert_select "form[action=?][method=?]", deliver_path(@deliver), "post" do

      assert_select "input#deliver_id[name=?]", "deliver[id]"

      assert_select "input#deliver_name[name=?]", "deliver[name]"

      assert_select "input#deliver_car[name=?]", "deliver[car]"

      assert_select "input#deliver_phone[name=?]", "deliver[phone]"
    end
  end
end
