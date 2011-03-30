require 'spec_helper'

describe Catalog do
  before(:each) do
    programming = Factory(:catalog, {:name => 'programming', :enabled => true} )
    Factory(:catalog, {:name => 'java', :enabled => true, :parent_catalog_id => programming.id})
    Factory(:catalog, {:name => 'ruby', :enabled => false, :parent_catalog_id => programming.id})
  end

  describe "name" do
    it "should be unique" do
      lambda {
        Factory.build(:catalog, {:name => 'programming'})
      }.call.should have_at_least(1).error_on(:name)
    end
  end

  describe "programming catalog" do
    it "should have 2 sub catalogs" do
      lambda {
        Catalog.where(:name => 'programming').first
      }.call.should have(2).sub_catalogs
    end

    it "should has 1 active sub catalogs" do
      lambda {
        Catalog.where(:name => 'programming').first
      }.call.should have(1).active_sub_catalogs
    end

  end

  describe "root_catalogs" do
    it "should has only 1 root catalog" do
      Catalog.should have(1).root_catalogs
    end

    it "should be programming" do
      Catalog.root_catalogs.first.name.should != "programming"
    end
  end

  describe "parent_catalog" do
    it "should "

  end

end
