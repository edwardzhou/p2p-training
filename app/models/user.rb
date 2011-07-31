# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# User
#
# Name                           SQL Type             Null    Default Primary
# ------------------------------ -------------------- ------- ------- -------
# id                             INTEGER              false           true   
# email                          varchar(255)         false                  
# encrypted_password             varchar(128)         false                  
# reset_password_token           varchar(255)         true                   
# reset_password_sent_at         datetime             true                   
# remember_created_at            datetime             true                   
# sign_in_count                  integer              true    0              
# current_sign_in_at             datetime             true                   
# last_sign_in_at                datetime             true                   
# current_sign_in_ip             varchar(255)         true                   
# last_sign_in_ip                varchar(255)         true                   
# confirmation_token             varchar(255)         true                   
# confirmed_at                   datetime             true                   
# confirmation_sent_at           datetime             true                   
# username                       varchar(20)          true                   
# gender                         varchar(20)          true    male           
# true_name                      varchar(20)          true                   
# contact_phone                  varchar(20)          true                   
# role                           varchar(20)          true    user           
# reference_to                   varchar(20)          true                   
# created_at                     datetime             true                   
# updated_at                     datetime             true                   
#
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

require "user_devise_support"

class User < ActiveRecord::Base


  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  include UserDeviseSupport

  validates_presence_of :email, :username, :true_name, :contact_phone
  validates_presence_of :login, :if => false
  validates_uniqueness_of :username


  has_one :user_detail

  has_many :favorites, :order => 'created_at DESC', :dependent => :destroy, :uniq => true
  has_many :interested_courses, :through => :favorites, :source => :course

  has_many :orders, :order => 'created_at DESC'

  has_and_belongs_to_many :roles

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :username, :true_name, :contact_phone, :gender, :user_detail_attributes,
                  :user_detail, :role, :reference_to, :roles, :role_ids

  # for login
  attr_accessor :login
  attr_accessible :login

  accepts_nested_attributes_for :user_detail

  after_initialize :initialize_user_detail


  def role?(role_name)
    role_name.downcase!
    found = false
    self.roles.each do |role|
      if role.name.downcase == role_name
        found = true
      end
    end

    found
  end

  def interested_course?(course_id)
    favorites.where(:course_id => course_id).count > 0
  end

  def invited_users
    User.where(:reference_to => self.username)
  end

  private
  def initialize_user_detail
    self.build_user_detail unless user_detail
  end

end
