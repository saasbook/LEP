require 'spec_helper'

describe Pair do
  
  before :each do
    @user1 = User.create(id: 2)
    @user2 = User.create(id: 3)
    @user3 = User.create(id: 4)
    @pair1 = Pair.create(id: 1, member1: @user1.id, member2: @user2.id, member3: '')
  end

  describe 'check nil or empty method' do
    it 'should correctly determine whether a string is empty or not' do
      expect(Pair.check_nil_or_empty('yolo')).to eq(false)
      expect(Pair.check_nil_or_empty('')).to eq(true)
    end
  end

  describe 'remove_user_from_pair' do
    it 'should remove a specified user from a pair' do
      Pair.remove_user_from_pair(@pair1.id, @user2.id)
      expect(Pair.find(@pair1.id).member2).to eq('')
      Pair.add_user_to_pair(@pair1.id, @user2.id)
      expect(Pair.find(@pair1.id).member2).to eq(@user2.id.to_s)
      Pair.remove_user_from_pair(@pair1.id, @user1.id)
      expect(Pair.find(@pair1.id).member1).to eq('')
      Pair.add_user_to_pair(@pair1.id, @user3.id)
      expect(Pair.find(@pair1.id).member1).to eq(@user3.id.to_s)
    end
  end

  describe 'add_user_to_pair' do
    it 'should add a specified user to a pair' do
      Pair.add_user_to_pair(@pair1.id, @user3.id)
      expect(Pair.find(@pair1.id).member3).to eq(@user3.id.to_s)

    end
  end

end
