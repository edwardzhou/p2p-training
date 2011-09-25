# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Catalog
#
# Name                           SQL Type             Null    Default Primary
# ------------------------------ -------------------- ------- ------- -------
# id                             int(11)              false           true   
# name                           varchar(255)         true                   
# description                    varchar(255)         true                   
# enabled                        tinyint(1)           true    true           
# parent_catalog_id              int(11)              true                   
# created_at                     datetime             true                   
# updated_at                     datetime             true                   
#
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

class Catalog < ActiveRecord::Base

  belongs_to :parent_catalog, :class_name => "Catalog", :foreign_key => "parent_catalog_id"

  has_many :sub_catalogs, :class_name => "Catalog", :foreign_key => "parent_catalog_id"
  has_and_belongs_to_many :courses

  validates_presence_of :name
  validates_uniqueness_of :name

  scope :root_catalogs, where(:parent_catalog_id => nil).order(:name)
  scope :active_catalogs, where(:enabled => true)
  scope :active_root_catalogs, root_catalogs.active_catalogs

  def active_sub_catalogs
    self.sub_catalogs.active_catalogs
  end

  def active_courses
    self.courses.where(:status.ne => 'close')
  end

end
