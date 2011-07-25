# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Order
#
# Name                           SQL Type             Null    Default Primary
# ------------------------------ -------------------- ------- ------- -------
# id                             INTEGER              false           true   
# order_code                     varchar(20)          true                   
# user_id                        integer              true                   
# total_amount                   decimal              true                   
# status                         varchar(20)          true                   
# payable                        boolean              true                   
# comment                        text                 true                   
# created_at                     datetime             true                   
# updated_at                     datetime             true                   
# campaign_id                    integer              true                   
# paid_time                      datetime             true                   
#
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

class Order < ActiveRecord::Base

  # 订单状态
  module Order::Status
    # 待付款
    PENDING_PAYMENT = 'pending_payment'

    # 已付款
    PAID = 'paid'

    # 已退款
    REFUNDED = 'refunded'

    # 取消
    CANCELLED = 'cancelled'
  end


  has_many :order_items,:dependent => :destroy
  belongs_to :user
  belongs_to :campaign

  scope :pending, where(:status => Status::PENDING_PAYMENT)

  def calc
    self.total_amount = self.order_items.inject(0) {|sum, item| sum + item.amount}
  end

  def self.by_code(code)
    results = find_by_order_code(code)
    if results.size > 0
      results[0]
    else
      nil
    end
  end


end
