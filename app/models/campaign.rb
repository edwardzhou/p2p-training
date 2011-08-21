# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Campaign
#
# Name                           SQL Type             Null    Default Primary
# ------------------------------ -------------------- ------- ------- -------
# id                             INTEGER              false           true   
# name                           varchar(50)          true                   
# start_date                     date                 true                   
# end_date                       date                 true                   
# register_due_date              date                 true                   
# course_id                      integer              true                   
# trainer_id                     integer              true                   
# status                         varchar(50)          true    open           
# price                          decimal              true                   
# discount_price                 decimal              true                   
# training_room_id               integer              true                   
# description                    text                 true                   
# created_at                     datetime             true                   
# updated_at                     datetime             true                   
# register_count                 integer              true    0              
#
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

class Campaign < ActiveRecord::Base
  module Status
    OPEN      = "open"
    CLOSED    = "closed"
    FINISHED  = "finished"
  end

  include DateTimeMacro

  belongs_to :course
  belongs_to :trainer, :class_name => 'User', :foreign_key => 'trainer_id'
  belongs_to :training_room, :class_name => 'Location', :foreign_key => 'training_room_id'

  validates_presence_of :name, :price, :discount_price
  validates :price, :discount_price, :numericality => {:greater_than => 0}

  has_many :orders
  has_many :registered_users, :through => :orders, :source => :user, :uniq => true

  ["start_date", "end_date", "register_due_date"].each do |the_date|
    define_date_and_time(the_date)
  end

  def valid_orders
    orders.where(:status => [Order::Status::PENDING_PAYMENT, Order::Status::PAID])
  end

  def to_s
    unless course.nil?
      "#{course.course_name} - #{name}"
    else
      name
    end
  end

end
