# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# User
#
# Name                           SQL Type             Null    Default Primary
# ------------------------------ -------------------- ------- ------- -------
# id                             INTEGER              false           true   
# email                          varchar(255)         false                  
# encrypted_password             varchar(128)         false                  
# password_salt                  varchar(255)         false                  
# reset_password_token           varchar(255)         true                   
# remember_token                 varchar(255)         true                   
# remember_created_at            datetime             true                   
# sign_in_count                  integer              true    0              
# current_sign_in_at             datetime             true                   
# last_sign_in_at                datetime             true                   
# current_sign_in_ip             varchar(255)         true                   
# last_sign_in_ip                varchar(255)         true                   
# confirmation_token             varchar(255)         true                   
# confirmed_at                   datetime             true                   
# confirmation_sent_at           datetime             true                   
# nick_name                      varchar(20)          true                   
# gender                         varchar(20)          true    male           
# true_name                      varchar(20)          true                   
# contact_phone                  varchar(20)          true                   
# created_at                     datetime             true                   
# updated_at                     datetime             true                   
#
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :nick_name, :true_name, :contact_phone
  validates_uniqueness_of :nick_name


  has_one :user_detail

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :nick_name, :true_name, :contact_phone, :gender, :user_detail_attributes,
                  :user_detail

  accepts_nested_attributes_for :user_detail

  after_initialize :initialize_user_detail

  private
  def initialize_user_detail
    self.build_user_detail unless user_detail
  end

end
