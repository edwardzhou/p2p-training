class Admin::Coupon < ActiveRecord::Base
  belongs_to :course
  belongs_to :campaign
end
