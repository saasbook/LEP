# given step definitions
Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    User.create!(user)
  end
end

Given /^I am an? (.*) user$/ do |user_type|
  OmniAuth.config.mock_auth[:google] = nil
  if user_type == "existing"
    OmniAuth.config.add_mock(:google, {
      :uid => '0',
      :user_info => {
        :name => 'existing',
        :email => 'existing@berkeley.edu'
      }
    })
  elsif user_type == "admin"
    OmniAuth.config.add_mock(:google, {
      :uid => '1',
      :user_info => {
        :name => 'admin',
        :email => 'admin@berkeley.edu'
      }
    })
  elsif user_type == "non-existing"
    OmniAuth.config.add_mock(:google, {
      :uid => '2',
      :user_info => {
        :name => 'non-existing',
        :email => 'non-existing@berkeley.edu'
      }
    })
  elsif user_type == "invalid"
    OmniAuth.config.add_mock(:google, { :uid => '3',
      :user_info => {
        :name => 'invalid',
        :email => 'invalid@berkeley.edu'
      }
    })
  else 
    flunk "Not a valid user type"
  end 
end

Given /^I am (not )?an admin$/ do |not_admin|
end

Given /^I am viewing the LEP homepage$/ do
end

When /^I sign in$/ do
  visit "/auth/google_oauth2"
end

# When step definitions
When /^I view the LEP page$/ do
end

# Then step definitions
Then /^I should be at the LEP (.*) home page$/ do |user_type|
end

