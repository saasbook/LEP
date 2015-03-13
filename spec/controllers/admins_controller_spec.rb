require 'spec_helper'

describe AdminsController do
  before :each do
    @admin = User.create(id: 1, first_name: 'admin', email: 'sample@berkeley.edu', admin: true)
  end

  describe '#index' do
    it 'renders the index template' do
      #assuming first user in db is an admin
      get(:index, nil, {id: @admin.id})
      expect(response).to render_template('index')
    end
  end

  describe '#create' do
  end

  describe '#show' do
    it 'should render the show template' do
      get(:show, {id: @admin.id}, {id: @admin.id})

      expect(response).to render_template('show')
    end
  end

  describe '#edit' do
  end

  describe '#destroy' do
#    it 'should render the template' do
#      @user = double(User, id: 2, first_name: 'Bob', email: 'delete@berkeley.edu', admin: false)
#      get :destroy, id: @user.id, 
#      expect(response).to render_template('index')
#    end

  end


end
