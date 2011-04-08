require 'spec_helper'

describe CatalogController do

  describe "GET 'view'" do
    it "should be successful" do
      get 'view'
      response.should be_success
    end
  end

end
