module Admin::UsersHelper
  def roles_names(user)
    user.roles.collect{|r| t("label.roles.#{r.name}")}
  end
end
