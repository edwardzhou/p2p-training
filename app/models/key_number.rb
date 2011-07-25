# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# KeyNumber
#
# Name                           SQL Type             Null    Default Primary
# ------------------------------ -------------------- ------- ------- -------
# id                             INTEGER              false           true   
# name                           varchar(255)         true                   
# pattern                        varchar(255)         true                   
# next_value                     integer              true                   
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
