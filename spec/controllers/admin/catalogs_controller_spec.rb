require 'spec_helper'

describe Admin::CatalogsController do

  describe "Only admin can perform actions" do
    login_admin

    describe "GET 'index'" do
      it "should be successful" do
        get 'index'
        response.should be_success
      end
    end
  end

  describe "Access denied without login" do
    describe "Get 'index'" do
      it "should be failed" do
        get 'index'
        response.should be_redirect
      end

    end
  end

  describe "Access denied with login as user" do
    login_user

    describe "Get 'index'" do
      it "should be failed" do
        get 'index'
        response.should be_redirect
      end
    end
  end

end
