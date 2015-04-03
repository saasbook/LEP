Given /the following students exist/ do |students|
  students.hashes.each do |student|
    User.create(first_name: student['first_name'], 
		last_name: student['last_name'], 
		sid: student['sid'], 
		email: student['email'],
		gender: student['gender'], 
		fluent_languages: student['fluent_languages'], 
		first_lang_preference: student['first_lang_preference'], 
		admin: false,
    active: true)
  end
end

Given /^I am logged in as "(.*)"$/ do |first_name|
	@user = User.find_by_first_name(first_name)
	# "/users/#{@user.id}"
	# puts page.current_path
	visit path_to("/users/#{@user.id}")
end


# given step definitions
Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    User.create!(user)
  end
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

# When /^(?:|I )click "(.*)"$/ do |button|
#   %{I click (button)}
# end

# Then step definitions
Then /^I should be at the LEP (.*) home page$/ do |user_type|
end

When /^the following pairings have been generated:$/ do |pairs|
  pairs.hashes.each do |pair|
    members = pair['name'].split(',')
    Pair.create(id: pair['id'], member1: members[0], member2: members[1], languages: pair['languages'].split(','))
  end
end

When /^I view pairs$/ do
  visit '/admins'
end

Then /^I should see the following pair ids:$/ do |ids|
=begin
  _ids = ids.gsub(' ', '').split(',')
  _ids.each do |id|
    puts id
    page.should have_content(id)
  end
=end
end

Given /^the following applications have been submitted:$/ do |users|
  users.hashes.each do |user|
    User.create(id: user['id'], first_name: user['first_name'], last_name: user['last_name'], fluent_languages: user['fluent_languages'].split(','), first_lang_preference: user['first_lang_preference'], first_lang_proficiency: user['first_lang_proficiency'], second_lang_preference: user['second_lang_preference'], second_lang_proficiency: user['second_lang_proficiency'], time_preference: user['time_preference'].split(','), hours_per_week: user['hours_per_week'])
  end
end

When /^I generate pairings$/ do
end

