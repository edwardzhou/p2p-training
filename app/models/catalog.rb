class Catalog < ActiveRecord::Base
  belongs_to :parent_catalog, :class_name => "Catalog", :foreign_key => "parent_catalog_id"

  has_many :sub_catalogs, :class_name => "Catalog", :foreign_key => "parent_catalog_id"
  has_many :courses

  validates_presence_of :name
  validates_uniqueness_of :name


end
