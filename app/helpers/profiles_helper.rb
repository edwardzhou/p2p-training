module ProfilesHelper
  def valid_invitations_count(user)
    User.invited_users(user.username).confirmed_users.count
  end

  def course_credits(user)
    User.invited_users(user.username).paid_users.count
  end
end
