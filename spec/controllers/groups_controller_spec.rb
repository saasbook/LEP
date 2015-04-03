require 'spec_helper'

describe GroupsController do
  describe '#index' do
    it 'should render the #index template' do
      @user = User.create(first_name: 'Blah', admin: false)
      get(:index, nil, {id: @user.id})
      expect(response).to render_template('index')
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
      @group = Group.create(language: "German", day: "Tuesday", time: "2-3PM", location: "1 Evans")
      get(:destroy, {id: @group.id})
    end
  end

end
