Given /^I have following user records$/ do |table|
  table.hashes.each do |user_row|
    confirmed = user_row.delete('confirmed')

    user = Factory(:user, user_row)
    user.confirm! if confirmed
  end
end
