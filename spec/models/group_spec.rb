require 'spec_helper'

describe Group do

  before :each do
    @user = User.create({
      id: 0,
      first_name: 'Blah', 
      email: 'blah@berkeley.edu', 
      admin: false,
      last_name: 'admin_lastname', 
      sid: '11111111', 
      academic_title: 'Undergraduate',
      major: 'x', 
      residency: 'x', 
      gender: 'x', 
      gender_preference: 'x',
      fluent_languages: ['x'], 
      lang_additional_info: 'x',
      first_lang_preference: 'x', 
      first_lang_proficiency: 'x', 
      second_lang_preference: 'x', 
      second_lang_proficiency: 'x',
      time_preference: ['x'], 
      hours_per_week: '0',
      user_motivation: 'x', 
      user_plan: 'x',
      group_leader: 'x',
      active: true
    })

    @user1 = User.create({
      id: 1,
      first_name: 'Blah', 
      email: 'blah@berkeley.edu', 
      admin: false,
      last_name: 'admin_lastname', 
      sid: '11111111', 
      academic_title: 'Undergraduate',
      major: 'x', 
      residency: 'x', 
      gender: 'x', 
      gender_preference: 'x',
      fluent_languages: ['x'], 
      lang_additional_info: 'x',
      first_lang_preference: 'x', 
      first_lang_proficiency: 'x', 
      second_lang_preference: 'x', 
      second_lang_proficiency: 'x',
      time_preference: ['x'], 
      hours_per_week: '0',
      user_motivation: 'x', 
      user_plan: 'x',
      group_leader: 'x',
      active: true
    })

    @group = Group.create(language: "German", day: "Tuesday", time: "2-3PM", location: "1 Evans", facilitator: @user.id)

  end

  describe '#total_groups' do
    it 'should return the number of groups' do
      Group.total_groups.should eq(1)
    end
  end

  describe 'to_csv' do
    it 'should create a csv of the groups' do
    end
  end

  describe 'add_member and remove member' do
    it 'should add a member to the group' do
      @group.add_member(@user1.id)
      @group.has_member?(@user1.id).should eq(true)
      @group.remove_member(@user1.id)
      @group.has_member?(@user1.id).should eq(false)
    end
  end

  describe 'get_facilitator' do
    it 'should return the facilitator of a group' do
      @group.get_facilitator().should eq(@user)
    end
  end

end
