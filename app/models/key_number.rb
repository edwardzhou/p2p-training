class KeyNumber < ActiveRecord::Base
  def next
    current = self.next_value
    self.next_value = self.next_value + 1
    self.save!
    current
  end

  def self.get(id_name)
    find_by_name(id_name)
  end

end
