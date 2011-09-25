# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# KeyNumber
#
# Name                           SQL Type             Null    Default Primary
# ------------------------------ -------------------- ------- ------- -------
# id                             int(11)              false           true   
# name                           varchar(255)         true                   
# pattern                        varchar(255)         true                   
# next_value                     int(11)              true                   
# created_at                     datetime             true                   
# updated_at                     datetime             true                   
#
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

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
