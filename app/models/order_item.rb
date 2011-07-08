# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# OrderItem
#
# Name                           SQL Type             Null    Default Primary
# ------------------------------ -------------------- ------- ------- -------
# id                             INTEGER              false           true   
# order_id                       integer              true                   
# campaign_id                    integer              true                   
# qty                            integer              true                   
# price                          decimal              true                   
# discount_price                 decimal              true                   
# amount                         decimal              true                   
# created_at                     datetime             true                   
# updated_at                     datetime             true                   
#
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :campaign

  def calc
    self.amount = self.qty * self.discount_price
  end
end
