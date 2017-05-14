require 'rails_helper'

RSpec.describe "donuts/show", type: :view do
  before(:each) do
    @donut = assign(:donut, Donut.create!(
      :name => "Name",
      :description => "MyText",
      :type => "Type",
      :shop_id => 2,
      :review => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Type/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/MyText/)
  end
end
