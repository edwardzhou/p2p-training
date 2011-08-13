class Invitation < ActiveRecord::Base

  validates_presence_of :friend_email, :friend_name, :my_name
  validates :friend_email, :email_format => true

  belongs_to :user


end
