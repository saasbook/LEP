Given /the following groups exist/ do |groups_hash|
  groups_hash.hashes.each do |group|
    Group.create({language: group['language'], day: group['day'], time: group['time'], location: group['location']})
  end
end

Given /^the following users exist$/ do |users_hash|
  users_hash.hashes.each do |user|
    User.create({first_name: user['first_name'], admin: user['admin']})
  end
end


Then /^I should see all users$/ do
  User.all.each do |user|
    puts user['first_name']
    assert page.has_content?(user['first_name'])
  end
end

Then /^I should see all groups$/ do
  Group.all.each do |group|
    puts movie['title']
    assert page.has_content?(group['title'])
  end
end
