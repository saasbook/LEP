require 'spec_helper'

describe AdminsController do
  before :each do
    @admin = User.create(id: 1, first_name: 'admin', email: 'sample@berkeley.edu', admin: true)
    @user = User.create(id: 2, first_name: 'joe', admin: false)
  end

  describe '#index' do
    it 'renders the index template if user is an admin' do
      get(:index, nil, {id: @admin.id})
      expect(response).to render_template('index')
    end

    it 'redirects if the user is not an admin' do
      get(:index, nil, {id: @user.id})
      response.should redirect_to user_path(@user.id)
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
  end

end
