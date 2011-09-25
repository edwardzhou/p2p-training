# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Payment
#
# Name                           SQL Type             Null    Default Primary
# ------------------------------ -------------------- ------- ------- -------
# id                             int(11)              false           true   
# notify_id                      varchar(255)         true                   
# notify_time                    datetime             true                   
# trade_no                       varchar(255)         true                   
# trade_status                   varchar(255)         true                   
# total_amount                   decimal(10,0)        true                   
# buyer_email                    varchar(255)         true                   
# raw_post                       text                 true                   
# created_at                     datetime             true                   
# updated_at                     datetime             true                   
# out_trade_no                   varchar(255)         true                   
# gmt_create                     datetime             true                   
# gmt_payment                    datetime             true                   
# use_coupon                     tinyint(1)           true                   
# subject                        varchar(255)         true                   
# body                           varchar(255)         true                   
# price                          decimal(10,0)        true                   
# quantity                       decimal(10,0)        true                   
# sign_type                      varchar(255)         true                   
# sign                           varchar(255)         true                   
# notify_type                    varchar(255)         true                   
# order_id                       int(11)              true                   
#
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

class Payment < ActiveRecord::Base
  module Status
    SUCCESS = "TRADE_SUCCESS"
    FINISHED = "TRADE_FINISHED"
    CLOSED = "TRADE_CLOSED"
  end

  belongs_to :paid_order, :class_name => "Order", :foreign_key => "order_id"

end
