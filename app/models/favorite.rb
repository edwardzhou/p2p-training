# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Favorite
#
# Name                           SQL Type             Null    Default Primary
# ------------------------------ -------------------- ------- ------- -------
# id                             INTEGER              false           true   
# user_id                        integer              true                   
# course_id                      integer              true                   
# created_at                     datetime             true                   
# updated_at                     datetime             true                   
#
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
end
