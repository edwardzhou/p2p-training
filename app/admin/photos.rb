ActiveAdmin.register Photo do

  # New Link on all actions except :new and :show
  action_item :only => :show do
    if controller.action_methods.include?('edit')
      link_to(I18n.t('active_admin.new_model', :model => active_admin_config.resource_name), new_resource_path)
    end
  end


  form :partial => "form"
end
