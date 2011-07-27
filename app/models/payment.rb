# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Payment
#
# Name                           SQL Type             Null    Default Primary
# ------------------------------ -------------------- ------- ------- -------
# id                             INTEGER              false           true   
# notify_id                      varchar(255)         true                   
# notify_time                    datetime             true                   
# trade_no                       varchar(255)         true                   
# trade_status                   varchar(255)         true                   
# total_amount                   decimal              true                   
# buyer_email                    varchar(255)         true                   
# raw_post                       text                 true                   
# created_at                     datetime             true                   
# updated_at                     datetime             true                   
# out_trade_no                   varchar(255)         true                   
# gmt_create                     datetime             true                   
# gmt_payment                    datetime             true                   
# use_coupon                     boolean              true                   
# subject                        varchar(255)         true                   
# body                           varchar(255)         true                   
# price                          decimal              true                   
# quantity                       decimal              true                   
# sign_type                      varchar(255)         true                   
# sign                           varchar(255)         true                   
# notify_type                    varchar(255)         true                   
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
