require 'singleton'
require "key_number"

class IdFactory
  include Singleton

  def self.next_num(id_name)
    @@mutex ||= Mutex.new

    @@mutex.synchronize() {
      key_num = KeyNumber.get(id_name.to_s)
      current = key_num.next
      new_num = Time.now.strftime(key_num.pattern).gsub("%{index}", sprintf("%05d", current))
      new_num
    }

  end

=begin
  def retrieve_next_id(id_name)
    inst_val_name = "@#{id_name.to_s}"
    unless self.instance_variable_defined?(inst_val_name)
      instance_variable_set(inst_val_name, KeyNumber.get(id_name))
    end

    key = self.instance_variable_get(inst_val_name)
    current = key.next

    new_num = Time.now.strftime(key.pattern).gsub("%{index}", sprintf("%05d", current))
    new_num
  end
=end

end