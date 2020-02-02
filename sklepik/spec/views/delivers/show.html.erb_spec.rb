require 'rails_helper'

RSpec.describe "delivers/show", type: :view do
  before(:each) do
    @deliver = assign(:deliver, Deliver.create!(
      :id => 2,
      :name => "Name",
      :car => "Car",
      :phone => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Car/)
    expect(rendered).to match(/3/)
  end
end
