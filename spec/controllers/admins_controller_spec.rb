require 'spec_helper'

describe AdminsController do
  before :each do
    @admin = User.create(id: 1, first_name: 'admin', email: 'sample@berkeley.edu', admin: true)
    @user = User.create({first_name: 'Robyn', 
      last_name: 'Zhang', 
      sid: '22223333', 
      email: 'robynz@berkeley.edu',
      academic_title: 'Undergraduate',
      major: 'Computer Science', 
      residency: 'Domestic', 
      gender: 'Female', 
      gender_preference: 'Female',
      fluent_languages: ['English'], 
      lang_additional_info: '',
      first_lang_preference: 'Chinese', 
      first_lang_proficiency: 'intermediate', 
      second_lang_preference: 'Spanish', 
      second_lang_proficiency: 'elementary',
      time_preference: ['Monday'], 
      hours_per_week: '2',
      user_motivation: 'I will be studying abroad.', 
      user_plan: 'I will set a regular meeting time with them.',
      admin: false,
      active: true
    })
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

  describe '#pairing' do
    it 'creates a CSV file and redirects to index' do 
      User.should_receive(:to_csv)
      Pair.should_receive(:generate_pairs)
      get :pairing, {id: @admin.id}, {id: @admin.id}
    end
    it 'should redirect to admins_path' do
      get :pairing, {id: @admin.id}, {id: @admin.id}
      expect(response).to redirect_to admins_path
    end
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

  describe '#make_facilitator' do
    it 'should call the model method to make a user a facilitator' do
      AdminsController.any_instance.stub(:check_admin)
      User.should_receive(:make_facilitator).with(2)
      put :make_facilitator, {:id => 1, :user_id => 2}
    end
  end

  describe '#revoke_admin' do
    it 'should call the model method to deactivate a user' do
      AdminsController.any_instance.stub(:check_admin)
      User.should_receive(:revoke_facilitator).with(2)
      put :revoke_facilitator, {:id => 1, :user_id => 2}
    end
  end

end
