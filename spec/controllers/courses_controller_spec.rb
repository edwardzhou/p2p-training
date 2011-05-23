require 'spec_helper'

describe CoursesController do

  before :each do
    setup_catalogs
    setup_courses
    setup_trainers
    setup_locations
    setup_campaigns
  end


  describe "POST 'add_to_favorite'" do
    it "should requires login" do
      logout

      post 'add_to_favorite', :id => @software_estimates.id
      response.should redirect_to(new_user_session_path)

    end

    it "should increase my_favorites"

  end
end
