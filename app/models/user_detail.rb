class UserDetail < ActiveRecord::Base
  belongs_to :user

  attr_accessible :company, :company_size,
                  :id_card, :birthday, :address, :zip

end
