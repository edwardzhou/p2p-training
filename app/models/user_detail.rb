# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# UserDetail
#
# Name                           SQL Type             Null    Default Primary
# ------------------------------ -------------------- ------- ------- -------
# id                             INTEGER              false           true   
# user_id                        integer              true                   
# id_card                        varchar(20)          true                   
# birthday                       date                 true                   
# company                        varchar(100)         true                   
# company_size                   varchar(50)          true                   
# address                        varchar(200)         true                   
# zip                            varchar(10)          true                   
# created_at                     datetime             true                   
# updated_at                     datetime             true                   
#
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

class UserDetail < ActiveRecord::Base
  belongs_to :user

  attr_accessible :company, :company_size,
                  :id_card, :birthday, :address, :zip

end
