class UserDetail < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :true_name, :contact_phone

  attr_accessible :true_name, :contact_phone, :company, :company_size,
                  :id_card, :birthday, :address, :zip

end
