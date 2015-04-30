require 'spec_helper'

describe Pair do
 
  before :each do

    @user1 = User.create(
      id: 1,
      first_name: "1", 
      last_name: "LASTNAME", 
      sid: "#{Random.new.rand(00000000..99999999)}", 
      email: "example@gmail.com", 
      academic_title: "DEFAULT", 
      major: "MAJOR", 
      residency: "DEFAULT",
      gender: "GENDER", 
      gender_preference: "DEFAULT", 
      fluent_languages: ["english"], 
      fluent_languages_other: "DEFAULT", 
      lang_additional_info: "DEFAULT",
      first_lang_preference: "DEFAULT",
      first_lang_proficiency: "DEFAULT", 
      second_lang_preference: "DEFAULT",
      second_lang_proficiency: "DEFAULT",
      group_leader: 'No',
      time_preference: ["monday"],
      hours_per_week: "0",
      user_motivation: "DEFAULT",
      user_plan: "DEFAULT",
      admin: false,
      active: true,
      facilitator: false,
      group_language: "DEFAULT"
    )
    
    @user2 = User.create(
      id: 2,
      first_name: "2", 
      last_name: "LASTNAME", 
      sid: "#{Random.new.rand(00000000..99999999)}", 
      email: "example@gmail.com", 
      academic_title: "DEFAULT", 
      major: "MAJOR", 
      residency: "DEFAULT",
      gender: "GENDER", 
      gender_preference: "DEFAULT", 
      fluent_languages: ["english"], 
      fluent_languages_other: "DEFAULT", 
      lang_additional_info: "DEFAULT",
      first_lang_preference: "DEFAULT",
      first_lang_proficiency: "DEFAULT", 
      second_lang_preference: "DEFAULT",
      second_lang_proficiency: "DEFAULT",
      group_leader: 'No',
      time_preference: ["monday"],
      hours_per_week: "0",
      user_motivation: "DEFAULT",
      user_plan: "DEFAULT",
      admin: false,
      active: true,
      facilitator: false,
      group_language: "DEFAULT"
    )

    @user3 = User.create(
      id: 3,
      first_name: "3", 
      last_name: "LASTNAME", 
      sid: "#{Random.new.rand(00000000..99999999)}", 
      email: "example@gmail.com", 
      academic_title: "DEFAULT", 
      major: "MAJOR", 
      residency: "DEFAULT",
      gender: "GENDER", 
      gender_preference: "DEFAULT", 
      fluent_languages: ["english"], 
      fluent_languages_other: "DEFAULT", 
      lang_additional_info: "DEFAULT",
      first_lang_preference: "DEFAULT",
      first_lang_proficiency: "DEFAULT", 
      second_lang_preference: "DEFAULT",
      second_lang_proficiency: "DEFAULT",
      group_leader: 'No',
      time_preference: ["monday"],
      hours_per_week: "0",
      user_motivation: "DEFAULT",
      user_plan: "DEFAULT",
      admin: false,
      active: true,
      facilitator: false,
      group_language: "DEFAULT"
    )

    @pair1 = Pair.create!(member1: @user1.id.to_s, member2: @user2.id.to_s, member3: '')

  end

  describe 'check if a user is in a pair' do
    it 'should correctly return that a user is in a pair' do
      expect(@pair1.has_member?(@user2.id.to_s)).to be_true
      expect(@pair1.has_member?(@user3.id.to_s)).to be_false
    end
  end

  describe 'check how many pairs exist' do
    it 'should correctly say how many pairs there are' do
      expect(Pair.total_pairs).eql?(1)
    end
  end

  describe 'check nil or empty method' do
    it 'should correctly determine whether a string is empty or not' do
      expect(Pair.check_nil_or_empty('yolo')).to eq(false)
      expect(Pair.check_nil_or_empty('')).to eq(true)
    end
  end

  describe 'remove_user_from_pair' do
    it 'should remove a specified user from a pair' do
      Pair.remove_user_from_pair(@pair.id, @user1.id)
      expect(Pair.find(@pair.id).member1).eql?('')
      Pair.add_user_to_pair(@pair.id, @user1.id)
      expect(Pair.find(@pair.id).member1).eql?(@user1.id)
      Pair.remove_user_from_pair(@pair.id, @user2.id)
      expect(Pair.find(@pair.id).member2).eql?('')
      Pair.add_user_to_pair(@pair.id, @user2.id)
      Pair.add_user_to_pair(@pair.id, @user3.id)
      Pair.remove_user_from_pair(@pair.id, @user3.id)
      expect(Pair.find(@pair.id).member3).eql?('')
    end
  end

  describe 'add_user_to_pair' do
    it 'should add a specified user to a pair' do
      Pair.add_user_to_pair(@pair1.id, @user3.id)
      expect(Pair.find(@pair.id).member3).to eq(@user3.id.to_s)
    end
  end

  describe 'verify_pair' do
    it 'should check for valid pairs' do
    end
  end

end
