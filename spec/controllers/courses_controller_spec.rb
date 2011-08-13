require 'spec_helper'

describe CoursesController do
  login_user

  before :each do
    setup_catalogs
    setup_courses
    setup_trainers
    setup_locations
    setup_campaigns
  end

  #describe "GET 'register'" do
  #
  #  it "should requires login" do
  #    logout
  #
  #    get 'register', :id => @software_estimates.id
  #    response.should redirect_to(new_user_session_path)
  #
  #  end
  #
  #end
end
