# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# OrderItem
#
# Name                           SQL Type             Null    Default Primary
# ------------------------------ -------------------- ------- ------- -------
# id                             int(11)              false           true   
# order_id                       int(11)              true                   
# campaign_id                    int(11)              true                   
# qty                            int(11)              true                   
# price                          decimal(10,0)        true                   
# discount_price                 decimal(10,0)        true                   
# amount                         decimal(10,0)        true                   
# created_at                     datetime             true                   
# updated_at                     datetime             true                   
# joiner_id                      int(11)              true                   
#
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :campaign

  def calc
    self.amount = self.qty * self.discount_price
  end
end
