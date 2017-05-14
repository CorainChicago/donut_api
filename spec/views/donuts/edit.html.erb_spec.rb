require 'rails_helper'

RSpec.describe "donuts/edit", type: :view do
  before(:each) do
    @donut = assign(:donut, Donut.create!(
      :name => "MyString",
      :description => "MyText",
      :type => "",
      :shop_id => 1,
      :review => "MyText"
    ))
  end

  it "renders the edit donut form" do
    render

    assert_select "form[action=?][method=?]", donut_path(@donut), "post" do

      assert_select "input#donut_name[name=?]", "donut[name]"

      assert_select "textarea#donut_description[name=?]", "donut[description]"

      assert_select "input#donut_type[name=?]", "donut[type]"

      assert_select "input#donut_shop_id[name=?]", "donut[shop_id]"

      assert_select "textarea#donut_review[name=?]", "donut[review]"
    end
  end
end
