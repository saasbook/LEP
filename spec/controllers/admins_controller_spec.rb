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

  describe '#activate' do
    it 'should call the model method to activate a user' do
      AdminsController.any_instance.stub(:check_admin)
      User.should_receive(:activate).with(2)
      put :activate, {:id => 1, :user_id => 2}
    end
  end

  describe '#deactivate' do
    it 'should call the model method to deactivate a user' do
      AdminsController.any_instance.stub(:check_admin)
      User.should_receive(:deactivate).with(2)
      put :deactivate, {:id => 1, :user_id => 2}
    end
  end
  
  describe '#make_admin' do
    it 'should call the model method to activate a user' do
      AdminsController.any_instance.stub(:check_admin)
      User.should_receive(:make_admin).with(2)
      put :make_admin, {:id => 1, :user_id => 2}
    end
  end

  describe '#revoke_admin' do
    it 'should call the model method to deactivate a user' do
      AdminsController.any_instance.stub(:check_admin)
      User.should_receive(:revoke_admin).with(2)
      put :revoke_admin, {:id => 1, :user_id => 2}
    end
  end

end
