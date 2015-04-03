Given /the following students exist/ do |students|
  students.hashes.each do |student|
    User.create(first_name: student['first_name'], 
		last_name: student['last_name'], 
		sid: student['sid'], 
		email: student['email'],
		gender: student['gender'], 
		fluent_languages: student['fluent_languages'], 
		first_lang_preference: student['first_lang_preference'], admin: false,
    active: true)
  end end

Given /^I am logged in as "(.*)"$/ do |first_name|
	@user = User.find_by_first_name(first_name)
	# "/users/#{@user.id}"
	# puts page.current_path
	visit path_to("/users/#{@user.id}")
end


# given step definitions
Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    User.create!(user) end
end

Given /^I am an? (.*) user$/ do |user_type|
  OmniAuth.config.mock_auth[:google_oauth2] = nil
  if user_type == "existing"
    OmniAuth.config.mock_auth[:google_oauth2] = 
      OmniAuth::AuthHash.new({:provider => 'google_oauth2',
        :uid => '0',
        :info => {
          :name => 'existing',
          :email => 'existing@berkeley.edu'
        }
      })
  elsif user_type == "admin"
    OmniAuth.config.mock_auth[:google_oauth2] = 
      OmniAuth::AuthHash.new({:provider => 'google_oauth2',
        :uid => '1',
        :info => {
          :name => 'admin',
          :email => 'admin@berkeley.edu'
        }
      })
  elsif user_type == "non-existing"
    OmniAuth.config.mock_auth[:google_oauth2] = 
      OmniAuth::AuthHash.new({:provider => 'google_oauth2',
        :uid => '2',
        :info => {
          :name => 'non-existing',
          :email => 'non-existing@berkeley.edu'
        }
      })
  elsif user_type == "invalid"
    OmniAuth.config.mock_auth[:google_oauth2] = 
      OmniAuth::AuthHash.new({:provider => 'google_oauth2',
        :uid => '3',
        :info => {
          :name => 'invalid',
          :email => 'invalid@gmail.com'
        }
      })
  else 
    flunk "Not a valid user type"
  end 
end

Given /^I am (not )?an admin$/ do |not_admin|
  if not_admin
    !(page.should have_content('Admin'))
  else
    page.should have_content('Admin')
  end
end

Given /^I am viewing the LEP homepage$/ do
end

When /^I sign in$/ do
  visit "/auth/google_oauth2"
end

# When step definitions
When /^I view the LEP page$/ do
end

When /^I (de)?activate (.+)$/ do |deactivate, user|
  @other_user = User.find_by_first_name(user)
  if deactivate
    click_link('Deactivate')
  else
    click_link('Activate')
  end
end
  
Then /^that student should be (de)?activated$/ do |deactivated| 
#debugger
  status = User.find(@other_user.id).active
  if deactivated
    status.should be_false
  else
    status.should be_true
  end
end

When /^I (make)?(remove)? (.+) as an admin$/ do |make, remove, user|
  @other_user = User.find_by_first_name(user)
  if make
    click_link('Make admin')
  else
    within find('tr', text: "#{@other_user.id}") do
      click_link('Delete admin')
    end
  end
end
  
Then /^that user should (not )?be an admin$/ do |not_admin| 
  status = User.find(@other_user.id).admin
  if not_admin
    status.should be_false
  else
    status.should be_true
  end
end
# When /^(?:|I )click "(.*)"$/ do |button|
#   %{I click (button)}
# end

# Then step definitions
Then /^I should be at the LEP (.*) home page$/ do |user_type|
end

