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

  scope :active_courses, where(:status.not_eq => "close")

  mount_uploader :avatar, AvatarUploader

  attr_accessible :course_name, :version, :status, :short_description,
                  :long_description, :duration_in_hours, :total_rating, :price, :discount_price,
                  :catalogs, :catalog_ids, :avatar, :avatar_cache

  def active_campaigns
    campaigns.where(:status => "open")
  end

  def to_s
    course_name
  end

end
