require 'rails_helper'

RSpec.describe "donuts/index", type: :view do
  before(:each) do
    assign(:donuts, [
      Donut.create!(
        :name => "Name",
        :description => "MyText",
        :type => "Type",
        :shop_id => 2,
        :review => "MyText"
      ),
      Donut.create!(
        :name => "Name",
        :description => "MyText",
        :type => "Type",
        :shop_id => 2,
        :review => "MyText"
      )
    ])
  end

  it "renders a list of donuts" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
