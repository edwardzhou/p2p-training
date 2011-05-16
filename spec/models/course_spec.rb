#encoding: utf-8

require 'spec_helper'


describe Course do
  #include CourseSpecHelper

  before :each do
    setup_catalogs
    setup_courses
    setup_trainers
    setup_locations
    setup_campaigns
  end

  describe ".active_courses" do

    it '应该有3个活动的课程' do
      Course.should have(4).active_courses
    end

  end

  describe ".campaigns" do

    it '应该共有2个活动' do
      course = Course.find_by_course_name("软件估算")
      course.should have(2).campaigns
    end

    it '应该有1个有效的活动' do
      course = Course.find_by_course_name("软件估算")
      course.should have(1).active_campaigns
    end

  end

  describe "assign catalogs" do

    it "should have 2 catalogs after set catalog_ids" do
      lambda {
        @tdd.catalog_ids = [@project_management.id, @programming.id]
        @tdd.save!
        Course.find(@tdd.id)
      }.call.should have(2).catalogs
    end

    it "should have 2 catalogs after update_attributes" do
      lambda {
        @tdd.update_attributes({:catalog_ids => [@programming.id, @project_management.id]})
        Course.find(@tdd.id)
      }.call.should have(2).catalogs
    end

  end


end
