#encoding: utf-8

ActiveAdmin.register Photo do

  # New Link on all actions except :new and :show
  action_item :only => :show do
    if controller.action_methods.include?('edit')
      link_to(I18n.t('active_admin.new_model', :model => active_admin_config.resource_name), new_resource_path)
    end
  end

  show do
    panel "照片详情" do
      attributes_table_for photo do
        row :id
        row :album
        row :display_order
        row :show_in_index
        row :description
        row :created_at
        row :updated_at
        row(:image) do
          image_tag photo.image_url(:thumb).to_s
        end
      end
    end

    active_admin_comments
  end

  form :partial => "form"
end
