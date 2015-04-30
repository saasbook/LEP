require 'spec_helper'

describe GroupsController do
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

    @group = Group.create(language: "German", day: "Tuesday", time: "2-3PM", location: "1 Evans", facilitator: @user.id)
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

  describe '#show' do
    it 'should show a group' do
      get(:show, {:id => @user.id} , {:id => @user.id})
    end
  end

  describe '#edit' do
    it 'should edit a group' do
      get(:edit, {:id => @group.id}, {:id => @user.id})
    end
  end

  describe '#update' do
    it 'should update a group' do
      get(:update, {id: @group.id, group: {language: 'Italian'} })
      response.should redirect_to(manage_groups_path)
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
    it "should notify student has successfully joined a group" do
      get(:join, {:id => @group.id}, {:id => @user.id})
      flash[:warning].should eq("You have joined a language group!")
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
