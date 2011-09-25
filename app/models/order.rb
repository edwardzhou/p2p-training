#encoding: utf-8

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Order
#
# Name                           SQL Type             Null    Default Primary
# ------------------------------ -------------------- ------- ------- -------
# id                             int(11)              false           true   
# order_code                     varchar(20)          true                   
# user_id                        int(11)              true                   
# total_amount                   decimal(10,0)        true                   
# status                         varchar(20)          true                   
# payable                        tinyint(1)           true                   
# comment                        text                 true                   
# created_at                     datetime             true                   
# updated_at                     datetime             true                   
# campaign_id                    int(11)              true                   
# paid_time                      datetime             true                   
# reason                         text                 true                   
# refunded_time                  datetime             true                   
# coupon_id                      int(11)              true                   
# present                        tinyint(1)           true                   
#
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

class Order < ActiveRecord::Base

  # 订单状态
  module Order::Status
    # 待付款
    PENDING_PAYMENT = 'pending_payment'

    # 待退款
    PENDING_REFUND = 'pending_refund'

    # 已付款
    PAID = 'paid'

    # 已退款
    REFUNDED = 'refunded'

    # 取消
    CANCELLED = 'cancelled'

    # 已上课
    FINISHED = 'finished'

    # 缺席
    ABSENT = 'absent'
  end


  has_many :order_items,:dependent => :destroy
  belongs_to :user
  belongs_to :campaign
  has_many :payments
  belongs_to :coupon

  scope :pending, where(:status => Status::PENDING_PAYMENT)
  scope :latest_orders, order("created_at DESC")
  scope :finished, where(:status => Status::FINISHED)
  scope :paid, where(:status => Status::PAID)
  scope :active, where(:status => [Status::PAID, Status::PENDING_PAYMENT])
  scope :cancelled, where(:status => [Status::CANCELLED, Status::PENDING_REFUND, Status::REFUNDED])

  attr_accessor :coupon_code

  def coupon_code
    unless coupon.nil?
      coupon.coupon_code
    end
  end

  def coupon_code=(code)
    new_coupon = Coupon.find_by_coupon_code(code)
    coupon = new_coupon unless new_coupon.nil?
  end

  def calc
    self.total_amount = self.order_items.inject(0) {|sum, item| sum + item.amount}
  end

  def self.by_code(code)
    find_by_order_code(code)
  end


end
