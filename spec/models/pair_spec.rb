require 'spec_helper'

describe Pair do
 
  before :each do
    @user1 = User.create(id: 2,
      first_name: 'User1', 
      email: 'user1@berkeley.edu', 
      admin: false,
      last_name: 'user_lastname', 
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
    @user2 = User.create(id: 3,
      first_name: 'User2', 
      email: 'user2@berkeley.edu', 
      admin: false,
      last_name: 'user_lastname', 
      sid: '22222222', 
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
    @user3 = User.create(id: 4,
      first_name: 'User3', 
      email: 'user3@berkeley.edu', 
      admin: false,
      last_name: 'user_lastname', 
      sid: '33333333', 
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
    @user4 = User.create(id: 5,
      first_name: 'User3', 
      email: 'user3@berkeley.edu', 
      admin: false,
      last_name: 'user_lastname', 
      sid: '33333333', 
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

    @pair1 = Pair.create(id: 1, member1: @user1.id.to_s, member2: @user2.id.to_s, member3: '', languages: ["Chinese", "English"])
  end

  describe 'check if a user is in a pair' do
    it 'should correctly return that a user is in a pair' do
      expect(@pair1.has_member?(@user2.id.to_s)).to be_true
      expect(@pair1.has_member?(@user3.id.to_s)).to be_false
    end
  end

  describe 'get_languages' do
    it 'should return languages in a string?' do

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
      Pair.remove_user_from_pair(@pair1.id, @user1.id)
      expect(Pair.find(@pair1.id).member1).eql?('')
      Pair.add_user_to_pair(@pair1.id, @user1.id)
      expect(Pair.find(@pair1.id).member1).eql?(@user1.id)
      Pair.remove_user_from_pair(@pair1.id, @user2.id)
      expect(Pair.find(@pair1.id).member2).eql?('')
      Pair.add_user_to_pair(@pair1.id, @user2.id)
      Pair.add_user_to_pair(@pair1.id, @user3.id)
      Pair.remove_user_from_pair(@pair1.id, @user3.id)
      expect(Pair.find(@pair1.id).member3).eql?('')
    end
  end

  describe 'add_user_to_pair' do
    it 'should add a specified user to a pair' do
      Pair.add_user_to_pair(@pair1.id, @user3.id)
      expect(Pair.find(@pair1.id).member3).to eq(@user3.id.to_s)
      Pair.should_receive(:remove_user_from_pair)
      Pair.remove_user_from_pair(@pair1.id, @user1.id)
      Pair.should_receive(:add_user_to_pair)
      Pair.add_user_to_pair(@pair1.id, @user1.id)
      expect(Pair.find(@pair1.id).member1).to eq(@user1.id.to_s)
      Pair.should_receive(:remove_user_from_pair)
      Pair.remove_user_from_pair(@pair1.id, @user2.id)
      Pair.should_receive(:add_user_to_pair)
      Pair.add_user_to_pair(@pair1.id, @user2.id)
      expect(Pair.find(@pair1.id).member2).to eq(@user2.id.to_s)
    end
  end

  describe 'verify_pair' do
    it 'should check for valid pairs' do
      Pair.should_receive(:verify_pair).and_return(true)
      Pair.verify_pair(@user3.id, @user4.id)
    end
    it 'should return false if users in pairs' do
      Pair.should_receive(:verify_pair).and_return(false)
      Pair.verify_pair(@user2.id, @user4.id)
    end
  end

  describe 'to_csv' do
    it 'should generate a csv file' do
    end
  end

  describe 'generate_pairs' do
    it 'should generate a csv file of pairs' do
      Pair.should_receive(:generate_pairs)
      Pair.generate_pairs
      expected_csv = File.read('script/test_pairs.csv')
      result_csv = File.read('script/final_pairs.csv')
      result_csv.should == expected_csv 
    end
  end

end
