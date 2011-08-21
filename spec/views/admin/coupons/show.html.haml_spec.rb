require 'spec_helper'

describe "admin_coupons/show.html.haml" do
  before(:each) do
    @coupon = assign(:coupon, stub_model(Admin::Coupon,
      :coupon_code => "Coupon Code",
      :coupon_name => "Coupon Name",
      :qty => 1,
      :discount_rate => 1,
      :disabled => false,
      :course => nil,
      :campaign => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Coupon Code/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Coupon Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
