#encoding: utf-8

module Admin::CatalogsHelper

  def generate_enable_link(catalog)
    if catalog.enabled
      link_to "禁用", disable_admin_catalog_path(catalog), :method => 'post'
    else
      link_to "启用", enable_admin_catalog_path(catalog), :method => 'post'
    end
  end

end
