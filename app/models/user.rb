class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :nick_name
  validates_uniqueness_of :nick_name

  has_one :user_detail

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :nick_name, :gender, :user_detail_attributes

  accepts_nested_attributes_for :user_detail

  after_initialize :initialize_user_detail

  private
  def initialize_user_detail
    self.build_user_detail unless user_detail
  end

end
