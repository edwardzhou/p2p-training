require 'spec_helper'

describe "admin_coupons/index.html.haml" do
  before(:each) do
    assign(:admin_coupons, [
      stub_model(Admin::Coupon,
        :coupon_code => "Coupon Code",
        :coupon_name => "Coupon Name",
        :qty => 1,
        :discount_rate => 1,
        :disabled => false,
        :course => nil,
        :campaign => nil
      ),
      stub_model(Admin::Coupon,
        :coupon_code => "Coupon Code",
        :coupon_name => "Coupon Name",
        :qty => 1,
        :discount_rate => 1,
        :disabled => false,
        :course => nil,
        :campaign => nil
      )
    ])
  end

  it "renders a list of admin_coupons" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Coupon Code".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Coupon Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
