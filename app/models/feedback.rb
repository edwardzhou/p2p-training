# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Feedback
#
# Name                           SQL Type             Null    Default Primary
# ------------------------------ -------------------- ------- ------- -------
# id                             int(11)              false           true   
# campaign_id                    int(11)              true                   
# user_id                        int(11)              true                   
# true_name                      varchar(255)         true                   
# contact_phone                  varchar(255)         true                   
# email                          varchar(255)         true                   
# useful_rating                  int(11)              true                   
# content_rating                 int(11)              true                   
# interact_rating                int(11)              true                   
# gain_from_lesson               varchar(255)         true                   
# interesting_feature            varchar(255)         true                   
# advice                         varchar(255)         true                   
# created_at                     datetime             true                   
# updated_at                     datetime             true                   
#
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

class Feedback < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :user
end
