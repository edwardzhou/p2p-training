#encoding: utf-8
class ConfirmationsController < Devise::ConfirmationsController
  # GET /resource/confirmation?confirmation_token=abcdef
  def show
    self.resource = resource_class.confirm_by_token(params[:confirmation_token])

    if resource.errors.empty?
      set_flash_message(:notice, :confirmed) if is_navigational_format?
      sign_in(resource_name, resource)
      logger.info("[新用户激活] - {username:#{resource.username}, email:#{resource.email}}")
      NotificationMailer.notify_user_activation(resource).deliver
      respond_with_navigational(resource){ redirect_to redirect_location(resource_name, resource) }
    else
      respond_with_navigational(resource.errors, :status => :unprocessable_entity){ render_with_scope :new }
    end
  end
end
