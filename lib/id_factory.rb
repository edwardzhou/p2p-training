require 'singleton'

class IdFactory
  include Singleton

  def self.next(id_name)
    return 0
  end



end