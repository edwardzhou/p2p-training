# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Comment
#
# Name                           SQL Type             Null    Default Primary
# ------------------------------ -------------------- ------- ------- -------
# id                             INTEGER              false           true   
# user_id                        integer              true                   
# course_id                      integer              true                   
# content                        varchar(255)         true                   
# created_at                     datetime             true                   
# updated_at                     datetime             true                   
#
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :course

end
