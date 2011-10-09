class Photo < ActiveRecord::Base
  belongs_to :album

  scope :show_in_index, where(:show_in_index => true)

  mount_uploader :image, PhotoUploader

  def self.hot_photos
    show_in_index.order('created_at DESC').limit(6)
  end

end
