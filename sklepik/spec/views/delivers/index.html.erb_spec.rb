require 'rails_helper'

RSpec.describe "delivers/index", type: :view do
  before(:each) do
    assign(:delivers, [
      Deliver.create!(
        :id => 2,
        :name => "Name",
        :car => "Car",
        :phone => 3
      ),
      Deliver.create!(
        :id => 2,
        :name => "Name",
        :car => "Car",
        :phone => 3
      )
    ])
  end

  it "renders a list of delivers" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Car".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
