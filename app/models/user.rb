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

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :username, :true_name, :contact_phone
  validates_uniqueness_of :username


  has_one :user_detail

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :username, :true_name, :contact_phone, :gender, :user_detail_attributes,
                  :user_detail, :role

  # for login
  attr_accessor :login
  attr_accessible :login

  accepts_nested_attributes_for :user_detail

  after_initialize :initialize_user_detail

  # The message to be shown if the account is inactive.
  def inactive_message
    !confirmed? ? I18n.t(:unconfirmed) : super
  end


  protected
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    login = conditions.delete(:login)
    logger.debug("login => #{login}")
    where(conditions).where(["username = :value OR email = :value", {:value => login}]).first
  end

  # Attempt to find a user by it's email. If a record is found, send new
  # password instructions to it. If not user is found, returns a new user
  # with an email not found error.
  def self.send_reset_password_instructions(attributes={})
    recoverable = find_recoverable_or_initialize_with_errors(reset_password_keys, attributes, :not_found)
    recoverable.send_reset_password_instructions if recoverable.persisted?
    recoverable
  end

  def self.find_recoverable_or_initialize_with_errors(required_attributes, attributes, error=:invalid)
    (case_insensitive_keys || []).each { |k| attributes[k].try(:downcase!) }

    attributes = attributes.slice(*required_attributes)
    attributes.delete_if { |key, value| value.blank? }

    if attributes.size == required_attributes.size
      if attributes.has_key?(:login)
        login = attributes.delete(:login)
        record = find_record(login)
      else
        record = where(attributes).first
      end
    end

    unless record
      record = new

      required_attributes.each do |key|
        value = attributes[key]
        record.send("#{key}=", value)
        record.errors.add(key, value.present? ? error : :blank)
      end
    end
    record
  end

  def self.find_record(login)
    logger.debug("login => #{login}")
    where(["username = :value OR email = :value", {:value => login}]).first
  end


  private
  def initialize_user_detail
    self.build_user_detail unless user_detail
  end

end
