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
#
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

class Order < ActiveRecord::Base
  has_many :order_items
  belongs_to :user

end
