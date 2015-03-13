require 'spec_helper'

describe GroupsController do
  describe '#index' do
    it 'should render the #index template' do
      @user = User.create(first_name: 'Blah', admin: false)
      get(:index, nil, {id: @user.id})
      expect(response).to render_template('index')
    end
  end

end
