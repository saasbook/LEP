require 'spec_helper'

describe GroupsController do
  before :each do
    @group = Group.create!(language: "German", day: "Tuesday", time: "2-3PM", location: "1 Evans")
    @user = User.create!(first_name: 'Blah', admin: false)
  end

  describe '#index' do
    it 'should render the #index template' do
      get(:index, nil, {id: @user.id})
      expect(response).to render_template('index')
    end
  end

  describe '#new' do
    it "should assign @user" do
      get(:new, {}, {id: @user.id})
      assigns(:user).should eq(@user)
    end
  end

  describe '#create' do
    let(:valid_params) { {'group' =>  {language: "German", day: "Tuesday", time: "2-3PM", location: "1 Evans"} }}
    it 'should create a new group' do
      post(:create, valid_params)
      assigns(:group).should be_persisted
    end
  end

  describe '#delete' do
    it 'should delete a group' do
      get(:destroy, {id: @group.id})
    end
  end

  describe '#join' do
    it "should allow a student to join a group" do
      get(:join, {:id => @group.id}, {:id => @user.id})
      assigns(:group).should eq(@group)
    end
    it "should redirect to the groups path" do
      get(:join, {:id => @group.id}, {:id => @user.id})
      response.should redirect_to(groups_path)
    end
  end

  describe '#leave' do
    it "should allow a student to leave a group" do
      get(:leave, {:id => @group.id}, {:id => @user.id})
      assigns(:group).should eq(@group)
    end
    it "should redirect to the groups path" do
      get(:join, {:id => @group.id}, {:id => @user.id})
      response.should redirect_to(groups_path)
    end
  end

end
