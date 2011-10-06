class Album < ActiveRecord::Base
  belongs_to :campaign
  has_many :photos
end
