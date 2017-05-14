require 'rails_helper'

RSpec.describe "donuts/new", type: :view do
  before(:each) do
    assign(:donut, Donut.new(
      :name => "MyString",
      :description => "MyText",
      :type => "",
      :shop_id => 1,
      :review => "MyText"
    ))
  end

  it "renders new donut form" do
    render

    assert_select "form[action=?][method=?]", donuts_path, "post" do

      assert_select "input#donut_name[name=?]", "donut[name]"

      assert_select "textarea#donut_description[name=?]", "donut[description]"

      assert_select "input#donut_type[name=?]", "donut[type]"

      assert_select "input#donut_shop_id[name=?]", "donut[shop_id]"

      assert_select "textarea#donut_review[name=?]", "donut[review]"
    end
  end
end
