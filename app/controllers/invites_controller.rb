class InvitesController < ApplicationController
  def invite
    user = User.find_by_username( params[:id] )
    session['reference_to'] = user.username unless user.nil?
    redirect_to new_user_registration_path
  end
end
