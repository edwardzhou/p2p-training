require 'spec_helper'

describe "admin_coupons/new.html.haml" do
  before(:each) do
    assign(:coupon, stub_model(Admin::Coupon,
      :coupon_code => "MyString",
      :coupon_name => "MyString",
      :qty => 1,
      :discount_rate => 1,
      :disabled => false,
      :course => nil,
      :campaign => nil
    ).as_new_record)
  end

  it "renders new coupon form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => admin_coupons_path, :method => "post" do
      assert_select "input#coupon_coupon_code", :name => "coupon[coupon_code]"
      assert_select "input#coupon_coupon_name", :name => "coupon[coupon_name]"
      assert_select "input#coupon_qty", :name => "coupon[qty]"
      assert_select "input#coupon_discount_rate", :name => "coupon[discount_rate]"
      assert_select "input#coupon_disabled", :name => "coupon[disabled]"
      assert_select "input#coupon_course", :name => "coupon[course]"
      assert_select "input#coupon_campaign", :name => "coupon[campaign]"
    end
  end
end
