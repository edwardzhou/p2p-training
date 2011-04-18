require 'spec_helper'

describe CatalogController do

  describe "GET 'view'" do
    it "should be successful" do
      catalog = Factory(:catalog, {:name => 'programming', :enabled => true})
      get 'view', {:id => catalog.id}
      response.should be_success
    end
  end

end
