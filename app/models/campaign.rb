# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Campaign
#
# Name                           SQL Type             Null    Default Primary
# ------------------------------ -------------------- ------- ------- -------
# id                             INTEGER              false           true   
# name                           varchar(255)         true                   
# start_date                     date                 true                   
# end_date                       date                 true                   
# duration_in_hour               integer              true                   
# register_due_date              date                 true                   
# course_id                      integer              true                   
# trainer_id                     integer              true                   
# status                         varchar(255)         true                   
# price                          integer              true                   
# original_price                 integer              true                   
# training_room_id               integer              true                   
# description                    text                 true                   
# created_at                     datetime             true                   
# updated_at                     datetime             true                   
#
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

class Campaign < ActiveRecord::Base
  belongs_to :course
  belongs_to :trainer, :class_name => 'User', :foreign_key => 'trainer_id'
  belongs_to :training_room, :class_name => 'Location', :foreign_key => 'training_room_id'

  validates_presence_of :name
end
