class Coupon < ActiveRecord::Base

  include DateTimeMacro

  belongs_to :course
  belongs_to :campaign

  validates_presence_of :coupon_code, :coupon_name, :qty

  attr_accessible :coupon_code, :coupon_name, :qty, :discount_rate,
                  :due_date, :course_id, :campaign_id, :disabled


  ["due_date"].each {|the_date| define_date_and_time(the_date)}


end
