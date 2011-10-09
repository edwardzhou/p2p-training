module Admin::UsersHelper
  def roles_names(user)
    user.roles.collect{|r| t("label.roles.#{r.name}")}
  end

  def pre_user(user)
    unless user.nil?
      arr = [user]
    end
    arr ||= []

    arr.collect{|c| {:id => c.id, :name => "#{c.true_name} - <#{c.username} | #{c.email}>"} }.to_json
  end
end
