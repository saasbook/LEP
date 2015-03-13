# given step definitions
Given /^I am (not )?authenticated$/ do |unauthenticated|
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

# When step definitions
When /^I view the LEP page$/ do
end

# Then step definitions
Then /^I should be at the LEP (.*) home page$/ do |user_type|
end

