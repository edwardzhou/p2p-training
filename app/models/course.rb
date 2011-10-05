#encoding: utf-8

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Course
#
# Name                           SQL Type             Null    Default Primary
# ------------------------------ -------------------- ------- ------- -------
# id                             int(11)              false           true   
# course_name                    varchar(255)         true                   
# version                        varchar(255)         true                   
# status                         varchar(255)         true                   
# short_description              text                 true                   
# long_description               text                 true                   
# duration_in_hours              int(11)              true                   
# total_rating                   int(11)              true                   
# price                          decimal(10,0)        true                   
# discount_price                 decimal(10,0)        true                   
# avatar                         varchar(255)         true                   
# created_at                     datetime             true                   
# updated_at                     datetime             true                   
# total_interesting_count        int(11)              true    0              
# total_register_count           int(11)              true    0              
# display_order                  int(11)              true                   
#
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

class Course < ActiveRecord::Base

  module Status
    OPEN      = "open"
    CLOSED    = "closed"
  end

  include RatingMacro

  validates_presence_of :course_name
  validates_uniqueness_of :course_name

  has_and_belongs_to_many :catalogs
  has_many :campaigns
  has_many :favorites, :order => 'created_at DESC', :dependent => :destroy
  has_many :interested_users,:through => :favorites, :order => 'created_at DESC', :source => :user
  has_many :comments, :order => 'created_at DESC', :dependent => :destroy
  has_many :feedbacks, :through => :campaigns

  scope :active_courses, where(:status.not_eq => Course::Status::CLOSED)

  # return top lastest courses, default 10
  scope :latest_courses, lambda{|*top| active_courses.where(:display_order.gt => 0).order("display_order").limit(top.first || 10) }

  # hot courses
  scope :hot_courses, lambda{|*top| active_courses.order("total_register_count DESC").limit(top.first || 10) }

  mount_uploader :avatar, AvatarUploader

  attr_accessible :course_name, :version, :status, :short_description,
                  :long_description, :duration_in_hours, :total_rating, :price, :discount_price,
                  :catalogs, :catalog_ids, :avatar, :avatar_cache, :remove_avatar,
                  :total_interesting_count, :total_register_count

  def active_campaigns
    campaigns.opening
  end

  def finished_campaigns
    campaigns.finished.order('start_date DESC')
  end

  def latest_comments(count=10)
    comments.limit(count)
  end

  def status_text
    t("label.status.#{self.status}")
  end

  def self.search(criteria)
    criteria = "%#{criteria}%"
    Course.where( { :course_name.like => criteria } \
      | { :short_description.like => criteria } \
      | { :long_description.like => criteria } )
  end

  def to_s
    course_name
  end

end
