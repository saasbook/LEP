Given /the following groups exist/ do |groups_hash|
  groups_hash.hashes.each do |group|
    members = group['members']
    if members
      members = members.split(',').map { |s| s.to_i }
    end
    Group.create({language: group['language'], 
                  day: group['day'], 
                  time: group['time'], 
                  location: group['location'],
                  facilitator: group['facilitator'], 
                  id: group['id'],
                  members: members
                  })
  end
end

Given /^the following users exist$/ do |users_hash|
  users_hash.hashes.each do |user|
    User.create({first_name: user['first_name'], admin: user['admin'], id: user['id']})
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

When /^User "(.*)" joins group "(.*)"$/ do |user_id, group_id|
  group = Group.find(group_id)
  group.add_member(user_id)
  group.save!
end

When /^User "(.*)" should (not )?belong to group "(.*)"$/ do |user_id, not_belong, group_id|
  group = Group.find(group_id)
  if not_belong
    group.has_member?(user_id).should be_false
  else
    group.has_member?(user_id).should be_true
  end
end

When /^User "(.*)" leaves group "(.*)"$/ do |user_id, group_id|
  group = Group.find(group_id)
  group.remove_member(user_id)
  group.save!
end
