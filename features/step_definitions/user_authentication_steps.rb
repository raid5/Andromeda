Given /^I am not authenticated$/ do
  visit destroy_user_session_path
end

Given /^I have one\s+user "([^\"]*)" with password "([^\"]*)"$/ do |email, password|
  @current_user = Factory(:user,
                          :email => email,
                          :password => password,
                          :password_confirmation => password
                          )
  # @current_user = User.create!(:email => email,
  #                              :password => password,
  #                              :password_confirmation => password)
end

Given /^I am authenticated as "([^\"]*)" with password "([^\"]*)"$/ do |email, password|
  Given %{I have one user "#{email}" with password "#{password}"}
  And %{I go to login}
  And %{I fill in "user_email" with "#{email}"}
  And %{I fill in "user_password" with "#{password}"}
  And %{I press "Sign in"}
end
