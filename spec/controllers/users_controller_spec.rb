require 'spec_helper'

describe UsersController do

  describe 'check_email' do
  end

  describe '#check_user' do
  end

  describe '#new' do
  	it 'renders form template' do
      get :new
      expect(response).to render_template('new')
  	end
  end

  # describe '#create' do
  #   before :each do
  #     @user = double(User, first_name: 'Sue', id: '5', email: 'sue@berkeley.edu')
  #     post :create
  #   end
  #   # it 'redirects to show' do
  #   #   response.should redirect_to '/users/5'
  #   #   #response.should be(200)
  #   #   #get :show, id: '5'
  #   # end
  #   it 'renders who template' do
  #     post :create, @user
  #     expect(response).to render_template('show')
  #   end
  # end

  # def create
  #   @user = User.new(user_params)
  #   @user.admin = false
  #   @user.save
  #   session[:id] = @user.id
  #   redirect_to user_path(@user)
  # end

  describe '#index' do
  	it 'renders index template' do
  	  get :index
  	  expect(response).to render_template('index')
  	end
  end

  describe '#show' do
    before :each do
      @user = double(User, first_name: 'Jane', id: '10', admin: false)
    end
    it 'should call User with find' do
      User.should_receive(:find).with(@user.id).and_return(double('User'))
      get :show, id: '10'
    end
    it 'should call check_email and redirect when the email is invalid' do
      get :show, {:id => "10"}, {:invalid_email => "lep@gmail.com"}
      response.should redirect_to users_invalid_path
      flash[:warning].should eq("lep@gmail.com is not a valid email. \n Please Logout and reauthenticate with a Berkeley email address.")
    end
    it "'should call check_user and redirect when the user id doesn't match" do
      get :show, {:id => "5"}, {:id => "10"}
      assigns(:admin).should be_false
      response.should redirect_to user_path(session[:id])
    end
  end

  describe '#edit' do
    before :each do
      @user = double(User, first_name: 'John', id: '27')
    end
    it 'should call User with find' do
      User.should_receive(:find).with(@user.id).and_return(double('User'))
      get :edit, id: '27'
    end
  end

  describe '#destroy' do
  end

  #working on this right now -Robyn; rspec went from 38% to 51.79% with new, index, edit, show
  # describe '#is_admin?' do
  #   before :each do
  #     @user = double(User, first_name: 'Bob', id: '11', email: 'bob@berkeley.edu', admin: false)
  #     allow(UsersController).to receive(:is_admin?).with(@user)
  #   end
  #   it 'pluck admin from user' do
  #     #User.should_receive(:where).with(:email => @user.email).and_return(double('User'))
  #     #@user.should_receive(:pluck).with(:admin).and_return(false)
  #     #response.should be(false)
  #     expect(response).to eq(false)
  #   end
  # end

  # describe '#home' do
  #   # before :each do
  #   #   @user = double(User, first_name: 'John', id: '27', email: 'john@berkeley.edu')
  #   #   @invalid_user = double(User, first_name: 'Billy', id: '3', email: 'billy@gmail.com')
  #   # end
  #   context 'berkeley email' do
  #     before :each do
  #       @user = double(User, first_name: 'John', id: '27', email: 'john@berkeley.edu')
  #     end
  #     it 'is a new user' do
  #     end
  #     it 'is an old user' do
  #     end
  #   end
  #   context 'invalid email' do
  #     before :each do
  #       @invalid_user = double(User, first_name: 'Billy', id: '3', email: 'billy@gmail.com')
  #     end
  #     it 'redirects to invalid page' do
  #       flash[:warning].should_not be_blank
  #     end
  #   end
  # end

end
