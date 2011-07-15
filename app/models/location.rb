# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Location
#
# Name                           SQL Type             Null    Default Primary
# ------------------------------ -------------------- ------- ------- -------
# id                             INTEGER              false           true   
# city                           varchar(50)          true                   
# address                        varchar(200)         true                   
# zip                            varchar(20)          true                   
# contact_phone                  varchar(50)          true                   
# map_url                        varchar(250)         true                   
# created_at                     datetime             true                   
# updated_at                     datetime             true                   
#
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

class Location < ActiveRecord::Base
  validates_presence_of :city, :address, :zip

  scope :sort_by_city, order('city DESC').order('address DESC')

  def full_address
    "#{city} #{address}"
  end

end
