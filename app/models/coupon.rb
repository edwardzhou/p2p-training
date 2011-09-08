class Coupon < ActiveRecord::Base

  module Type
    BY_RATE = 1
    BY_PRICE = 2
  end

  include DateTimeMacro

  belongs_to :course
  belongs_to :campaign

  validates_presence_of :coupon_code, :coupon_name, :qty

  attr_accessible :coupon_code, :coupon_name, :qty, :discount_rate,
                  :discount_type, :discount_price, :due_date, :course_id, :campaign_id, :disabled


  ["due_date"].each {|the_date| define_date_and_time(the_date)}

  def decrease_qty
    self.qty = self.qty - 1
    self.save
  end

end
