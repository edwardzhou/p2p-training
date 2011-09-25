# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Coupon
#
# Name                           SQL Type             Null    Default Primary
# ------------------------------ -------------------- ------- ------- -------
# id                             int(11)              false           true   
# coupon_code                    varchar(255)         true                   
# coupon_name                    varchar(255)         true                   
# qty                            int(11)              true                   
# discount_rate                  int(11)              true                   
# due_date                       datetime             true                   
# disabled                       tinyint(1)           true                   
# course_id                      int(11)              true                   
# campaign_id                    int(11)              true                   
# created_at                     datetime             true                   
# updated_at                     datetime             true                   
# discount_type                  int(11)              true                   
# discount_price                 decimal(10,0)        true                   
#
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

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
