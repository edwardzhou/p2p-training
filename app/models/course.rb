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
# duration_in_hours              integer              true                   
# total_rating                   integer              true                   
# price                          decimal              true                   
# discount_price                 decimal              true                   
# created_at                     datetime             true                   
# updated_at                     datetime             true                   
#
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

class Course < ActiveRecord::Base
  validates_presence_of :course_name
  validates_uniqueness_of :course_name

  has_and_belongs_to_many :catalogs
  has_many :campaigns
  has_many :favorites, :order => 'created_at DESC', :dependent => :destroy
  has_many :interested_users,:through => :favorites, :order => 'created_at DESC', :source => :user

  scope :active_courses, where(:status.not_eq => "close")
  #scope :active_campaigns2, campaigns.where(:status => "open")

  mount_uploader :avatar, AvatarUploader

  attr_accessible :course_name, :version, :status, :short_description,
                  :long_description, :duration_in_hours, :total_rating, :price, :discount_price,
                  :catalogs, :catalog_ids, :avatar, :avatar_cache

  def active_campaigns
    campaigns.where(:status => "open")
  end

  def status_text
    t("label.status.#{self.status}")
  end

  def to_s
    course_name
  end

end
