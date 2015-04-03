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
      get :pairing, {id: @admin.id}, {id: @admin.id}
    end
    it 'should redirect to admins_path' do
      get :pairing, {id: @admin.id}, {id: @admin.id}
      expect(response).to redirect_to admins_path
    end
  end

end
