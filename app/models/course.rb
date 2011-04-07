# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Course
#
# Name                           SQL Type             Null    Default Primary
# ------------------------------ -------------------- ------- ------- -------
# id                             INTEGER              false           true   
# course_name                    varchar(255)         true                   
# version                        varchar(255)         true                   
# status                         varchar(255)         true                   
# short_description              text                 true                   
# long_description               text                 true                   
# created_at                     datetime             true                   
# updated_at                     datetime             true                   
#
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

class Course < ActiveRecord::Base
  has_and_belongs_to_many :catalogs

  validates_presence_of :course_name
  validates_uniqueness_of :course_name

end
