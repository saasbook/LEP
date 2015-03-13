Given /the following students exist/ do |students|
  students.hashes.each do |student|
    User.create(first_name: student['first_name'], 
		last_name: student['last_name'], 
		sid: student['sid'], 
		email: student['email'],
		gender: student['gender'], 
		fluent_languages: student['fluent_languages'], 
		first_lang_preference: student['first_lang_preference'], 
		admin: false)
  end
end

Given /^I am logged in as "(.*)"$/ do |first_name|
	@user = User.find_by_first_name(first_name)
	# "/users/#{@user.id}"
	# puts page.current_path
	visit path_to("/users/#{@user.id}")
end


# given step definitions
Given /^I am (not )?authenticated$/ do |unauthenticated|
end

Given /^I am (not )?an admin$/ do |not_admin|
end

Given /^I am viewing the LEP homepage$/ do
end

# When step definitions
When /^I view the LEP page$/ do
end

# Then step definitions
Then /^I should be at the LEP (.*) home page$/ do |user_type|
end

