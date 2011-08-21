require "spec_helper"

describe Admin::CouponsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/admin_coupons" }.should route_to(:controller => "admin_coupons", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/admin_coupons/new" }.should route_to(:controller => "admin_coupons", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/admin_coupons/1" }.should route_to(:controller => "admin_coupons", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/admin_coupons/1/edit" }.should route_to(:controller => "admin_coupons", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/admin_coupons" }.should route_to(:controller => "admin_coupons", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/admin_coupons/1" }.should route_to(:controller => "admin_coupons", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/admin_coupons/1" }.should route_to(:controller => "admin_coupons", :action => "destroy", :id => "1")
    end

  end
end
