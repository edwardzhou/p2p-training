class RegistrationsController < Devise::RegistrationsController

  # GET /new
  def new
    # for promotion
    session['reference_to'] = params[:ref] if User.find_by_username(params[:ref])
    super
  end

  # POST /resource
  def create
    build_resource

    # default to assign 'user' role
    resource.roles << Role.ROLE_USER

    if resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_in(resource_name, resource)
        respond_with resource, :location => redirect_location(resource_name, resource)
      else
        set_flash_message :notice, :inactive_signed_up, :reason => resource.inactive_message.to_s if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords(resource)
      respond_with_navigational(resource) { render_with_scope :new }
    end
  end

end
