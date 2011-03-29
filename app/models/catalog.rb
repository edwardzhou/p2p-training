class Catalog < ActiveRecord::Base

  belongs_to :parent_catalog, :class_name => "Catalog", :foreign_key => "parent_catalog_id"

  has_many :sub_catalogs, :class_name => "Catalog", :foreign_key => "parent_catalog_id"
  has_and_belongs_to_many :courses

  validates_presence_of :name
  validates_uniqueness_of :name

  scope :root_catalogs, where( { :parent_catalog_id => nil, :enabled => true} )

  def active_sub_catalogs
    self.sub_catalogs.where(:enabled => true)
  end

end
