require 'spec_helper'

describe AssetsController do

  describe "Access is not allowed." do

    it "path starts with '..'" do
      get 'browse_images', {'path' => ".."}
      response.body.should =~ /Access is not allowed/
    end

    it "path ends with '..'" do
      get 'browse_images', {'path' => "/.."}
      response.body.should =~ /Access is not allowed/
    end

    it "path contains '..' in the middle" do
      get 'browse_images', {'path' => "abc/../test"}
      response.body.should =~ /Access is not allowed/
    end

  end

  describe "Paramters is not valid." do

    it "path do not ends with '/'" do
      get 'browse_images', {'path' => "/test"}
      response.body.should =~ /Paramters is not valid/
    end

  end

  it "should return 'directory is not exists." do
    get 'browse_images', {'path' => "/test/"}
    response.body.should =~ /Directory is not exists/
  end

  it "should be successful with json" do
    get 'browse_images', {'path' => "/"}
    result = JSON.parse!( response.body )
  end

end
