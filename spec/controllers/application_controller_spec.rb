require 'spec_helper'

describe ApplicationController do

  describe '#nav_link' do
    it 'naviagtes' do
      a = ApplicationController.new
      a.should_receive(:content_tag)
      a.nav_link("Users", users_path)
    end
  end

end
