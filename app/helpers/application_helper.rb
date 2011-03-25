module ApplicationHelper
  def show_msg
    render "common/show_msg"
  end

  def setup_user(user)
    user.tap do |u|
      u.build_user_detail if u.user_detail.nil?
    end
  end
end
