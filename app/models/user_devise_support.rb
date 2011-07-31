

module UserDeviseSupport

  module ClassMethods
    #protected
    def find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      login = conditions.delete(:login)
      logger.debug("login => #{login}")
      where(conditions).where(["username = :value OR email = :value", {:value => login}]).first
    end

    # Attempt to find a user by it's email. If a record is found, send new
    # password instructions to it. If not user is found, returns a new user
    # with an email not found error.
    def send_reset_password_instructions(attributes={})
      recoverable = find_recoverable_or_initialize_with_errors(reset_password_keys, attributes, :not_found)
      recoverable.send_reset_password_instructions if recoverable.persisted?
      recoverable
    end

    def find_recoverable_or_initialize_with_errors(required_attributes, attributes, error=:invalid)
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

    def find_record(login)
      logger.debug("login => #{login}")
      where(["username = :value OR email = :value", {:value => login}]).first
    end
  end

  protected
  extend ActiveSupport::Concern

end