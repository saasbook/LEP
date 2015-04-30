require 'spec_helper'

describe User do
# pending "add some examples to (or delete) #{__FILE__}"
  describe 'activating and deactivating users' do
    it 'activating a user should set its status to active' do
      @user = FactoryGirl.create(
        :user, 
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
        active: false
        )
      User.activate(@user.id) 
      expect(User.find(@user.id).active).to eq(true)
    end
    
    it 'deactivating a user should set its status to inactive' do
      @user = FactoryGirl.create(:user, active: true,
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
        group_leader: 'x'
      )
      User.deactivate(@user.id)
      expect(User.find(@user.id).active).to eq(false)
    end
  end
  
  describe 'making and removing admin privileges' do
    it 'giving a non admin user admin permissions should set the admin boolean to true' do
      @user = FactoryGirl.create(:user, admin: false,
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
        group_leader: 'x'
      )
      User.make_admin(@user.id) 
      expect(User.find(@user.id).admin).to eq(true)
    end

    it "revoking an admin's permission should set the admin boolean to true" do
      @user = FactoryGirl.create(:user, admin: true,
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
        group_leader: 'x'
      )
      User.revoke_admin(@user.id) 
      expect(User.find(@user.id).admin).to eq(false)
    end
  end 

  describe 'making and removing facilitator privileges' do
    it 'giving a non facilitator user facilitator permissions should set the facilitator boolean to true' do
      @user = FactoryGirl.create(:user, facilitator: false,
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
      )
      User.make_facilitator(@user.id) 
      expect(User.find(@user.id).facilitator).to eq(true)
    end

    it "revoking a facilitator's permission should set the facilitator boolean to true" do
      @user = FactoryGirl.create(:user, facilitator: true,
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
      )
      User.revoke_facilitator(@user.id) 
      expect(User.find(@user.id).facilitator).to eq(false)
    end
  end 

end

