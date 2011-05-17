require 'spec_helper'

describe Admin::CoursesController do

  describe "login as admin" do
    login_admin

    describe "update" do

      before :each do
        setup_catalogs
        setup_courses
        setup_trainers
        setup_locations
        setup_campaigns
      end

      it "should be success" do
        attrs = @software_estimates.attributes
        attrs[:catalog_ids] = [@project_management.id, @programming.id]
        put :update, :id => @software_estimates.id, :course => attrs
        response.should redirect_to(admin_courses_path)
      end

    end


  end

end
