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

  describe "Creating a csv file" do
    it "Should create a csv file" do
      @user = FactoryGirl.create(:user)
      User.to_csv
    end
  end

  describe "Updating pair id" do
    it "should update a user's pair id" do
      @user = FactoryGirl.create(:user)
      User.set_pair_id(@user.id, 0)
      @user.pair_id.should eq(0)
    end
  end

  describe "Get User's full name" do
    it "should get the user's full name" do
      @user = FactoryGirl.create(:user)
      User.full_name(@user.id).should eq("#{@user.first_name} #{@user.last_name}")
    end
  end

  describe "Get analytics info" do
    before(:each) do
      @user = FactoryGirl.create(:user)
    end
    it "Should get total users" do
      User.total_users.should eq(1)
    end
    it "Should get all users" do
      User.get_users.should eq([@user])
    end
    it "Should get total admins" do
      User.total_admins.should eq(0)
    end
  end

  describe "Generate pairing csv" do
    it "should generate a pairing csv" do
      User.pairing_csv
    end
  end

  describe "Set Application Deadline" do
    it "should set an application deadline" do
      User.set_application_deadline("05/01/2015")
      User.get_application_deadline.should eq("05/01/2015")
    end
  end

end

