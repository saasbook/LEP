require 'spec_helper'

describe User do
# pending "add some examples to (or delete) #{__FILE__}"
  describe 'activating and deactivating users' do
    it 'activating a user should set its status to active' do
      @user = FactoryGirl.create(:user, active: false)
      User.activate(@user.id) 
      expect(User.find(@user.id).active).to eq(true)
    end
    
    it 'deactivating a user should set its status to inactive' do
      @user = FactoryGirl.create(:user, active: true)
      User.deactivate(@user.id)
      expect(User.find(@user.id).active).to eq(false)
    end
  end
  
  describe 'making and removing admin privileges' do
    it 'giving a non admin user admin permissions should set the admin boolean to true' do
      @user = FactoryGirl.create(:user, admin: false)
      User.make_admin(@user.id) 
      expect(User.find(@user.id).admin).to eq(true)
    end

    it "revoking an admin's permission should set the admin boolean to true" do
      @user = FactoryGirl.create(:user, admin: true)
      User.revoke_admin(@user.id) 
      expect(User.find(@user.id).admin).to eq(false)
    end
  end 

  describe 'making and removing facilitator privileges' do
    it 'giving a non facilitator user facilitator permissions should set the facilitator boolean to true' do
      @user = FactoryGirl.create(:user, facilitator: false)
      User.make_facilitator(@user.id) 
      expect(User.find(@user.id).facilitator).to eq(true)
    end

    it "revoking a facilitator's permission should set the facilitator boolean to true" do
      @user = FactoryGirl.create(:user, facilitator: true)
      User.revoke_facilitator(@user.id) 
      expect(User.find(@user.id).facilitator).to eq(false)
    end
  end 

end

