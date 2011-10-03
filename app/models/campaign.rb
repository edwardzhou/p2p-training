# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Campaign
#
# Name                           SQL Type             Null    Default Primary
# ------------------------------ -------------------- ------- ------- -------
# id                             int(11)              false           true   
# name                           varchar(50)          true                   
# start_date                     datetime             true                   
# end_date                       datetime             true                   
# register_due_date              datetime             true                   
# course_id                      int(11)              true                   
# trainer_id                     int(11)              true                   
# status                         varchar(50)          true    open           
# price                          decimal(10,0)        true                   
# discount_price                 decimal(10,0)        true                   
# training_room_id               int(11)              true                   
# description                    text                 true                   
# created_at                     datetime             true                   
# updated_at                     datetime             true                   
# register_count                 int(11)              true    0              
#
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

class Campaign < ActiveRecord::Base
  module Status
    OPEN      = "open"
    CLOSED    = "closed"
    FINISHED  = "finished"
    CANCELLED = "cancelled"
  end

  include DateTimeMacro
  include RatingMacro

  belongs_to :course
  belongs_to :trainer, :class_name => 'User', :foreign_key => 'trainer_id'
  belongs_to :training_room, :class_name => 'Location', :foreign_key => 'training_room_id'

  validates_presence_of :name, :price, :discount_price
  validates :price, :discount_price, :numericality => {:greater_than_or_equal_to => 0}

  has_many :orders
  has_many :registered_users, :through => :orders, :source => :user, :uniq => true
  has_many :feedbacks, :order => "created_at DESC"

  scope :opening, where(:status => Campaign::Status::OPEN)
  scope :finished, where(:status => Campaign::Status::FINISHED)
  scope :cancelled, where(:status => Campaign::Status::CANCELLED)
  scope :closed, where(:status => Campaign::Status::CLOSED)


  ["start_date", "end_date", "register_due_date"].each do |the_date|
    define_date_and_time(the_date)
  end

  def valid_orders
    orders.active
  end

  def presents
    orders.presented
  end

  def finish!
    self.status = Status::FINISHED
    valid_orders.each do |order|
      order.status = order.present? ? Order::Status::FINISHED : Order::Status::ABSENT
      order.save!
    end
    self.save!

  end

  def full_name
    unless self.course.nil?
      "#{course.course_name} - #{name}"
    else
      name
    end
  end

  def is_opening
    Campaign::Status::OPEN == self.status
  end

  def to_s
    full_name
  end

end
