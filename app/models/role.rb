# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Role
#
# Name                           SQL Type             Null    Default Primary
# ------------------------------ -------------------- ------- ------- -------
# id                             int(11)              false           true   
# name                           varchar(255)         true                   
# description                    varchar(255)         true                   
# created_at                     datetime             true                   
# updated_at                     datetime             true                   
#
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

class Role < ActiveRecord::Base
  has_and_belongs_to_many :users

  # To make Role supports ROLE_<ROLE_NAME> class method
  # which will return the role instance which name is equal to ROLE_NAME.downcase
  # if no record matched, returns nil
  # eg. roles tables already has record which name is admin
  #     Role.ROLE_ADMIN will return that instance
  #     Role.ROLE_NONEXIST will return nil
  def self.method_missing(name, *args, &block)
    method_name = /^ROLE_(.*)$/.match(name)
    if method_name.nil? || (name[-1] == "?")
      return super
    end

    role_name = method_name[1]
    role = find_by_name(role_name.downcase)
    return nil if role.nil?

    # store role to class variable @@role_xxx for speed up further access
    self.class_variable_set("@@#{name.downcase}".to_sym, role)

    # define new class method ROLE_XXXXX to return @@role_xxx
    logger.info("  define new class method Role.#{name}")
    class_eval <<-RUBY
      def self.#{name}
        @@#{name.downcase}
      end
    RUBY

    role
  end
end
