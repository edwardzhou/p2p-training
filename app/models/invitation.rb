# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Invitation
#
# Name                           SQL Type             Null    Default Primary
# ------------------------------ -------------------- ------- ------- -------
# id                             INTEGER              false           true   
# user_id                        integer              true                   
# friend_email                   varchar(255)         true                   
# friend_name                    varchar(255)         true                   
# my_name                        varchar(255)         true                   
# content                        text                 true                   
# last_resend_time               datetime             true                   
# signed_up                      boolean              true                   
# created_at                     datetime             true                   
# updated_at                     datetime             true                   
#
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

class Invitation < ActiveRecord::Base

  validates_presence_of :friend_email, :friend_name, :my_name
  validates :friend_email, :email_format => true

  belongs_to :user


end
