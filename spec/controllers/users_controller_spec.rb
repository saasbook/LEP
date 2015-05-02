require 'spec_helper'

describe UsersController do

  describe '#new' do
  	it 'renders form template' do
      get :new
      expect(response).to render_template('new')
  	end
  end

  describe '#create' do
    let(:valid_params) { 
      {'user' => {
          id: 5, first_name: 'Bob', 
          email: 'bob@berkeley.edu', 
          admin: false,
          last_name: 'Smith', 
          sid: rand.to_s[2..9], 
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
        } 
      }
    }
    it 'creates a user' do
      post :create, valid_params
      assigns(:user).should be_persisted
    end
  end

  describe '#index' do
  	it 'renders index template' do
  	  get :index
  	  #expect(response).to render_template('index')
      expect(response).to redirect_to admins_path
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
    it "Should verify that the user has a valid email" do
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
      get :edit, {:id =>"27"}
    end
  end

  describe '#update' do
    before :each do
      @user = double(User, first_name: 'John', id: '27')
    end
    it 'should call User with find' do
      User.should_receive(:find).with(@user.id).and_return(double('User'))
      get :show, id: '27'
    end
  end

  describe '#destroy' do
    before :each do
      @user = User.create(id: 2, first_name: 'Bob', 
        email: 'delete@berkeley.edu', 
        admin: false,
        last_name: 'Smith', 
        sid: rand.to_s[2..9], 
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

      @admin = User.create(first_name: 'Admin', 
        id: 1, 
        admin: true,
        email: 'admin56@berkeley.edu',

        last_name: 'admin_lastname', 
        sid: rand.to_s[2..9], 
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
    end

    it 'should redirect to admin path when admin deletes a user' do
      get(:destroy, {id: @user.id}, {id: @admin.id})
      response.should redirect_to admins_path
    end

    it 'should redirect to user path when user tries to delete a user' do
      get(:destroy, {id: @user.id}, {id: @user.id})
      response.should redirect_to user_path(session[:id])
    end
  end

  describe '#activate' do
    before :each do
      @user = double(User, first_name: 'John', last_name: 'Smith', id: '27', active: false)
    end
    it "should deactivate an user" do
      User.should_receive(:find).with(@user.id).and_return(@user)
      @user.should_receive(:update_attributes).with({:active => true}).and_return(true)
      post :activate, :id => "27"
      flash[:warning].should eq("John Smith's account has been reactivated.")
    end
  end

  describe '#deactivate' do
    before :each do
      @user = double(User, first_name: 'John', last_name: 'Smith', id: '27', active: true)
    end
    it "should deactivate an user" do
      User.should_receive(:find).with(@user.id).and_return(@user)
      @user.should_receive(:update_attributes).with({:active => false}).and_return(true)
      post :deactivate, :id => "27"
      flash[:warning].should eq("John Smith's account has been deactivated.")
    end
  end


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
