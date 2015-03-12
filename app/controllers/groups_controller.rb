class GroupsController < ApplicationController
  
  def new
  end

  def create
    
  end

  def index
    @user = User.find(session[:id]['admin'])
    @groups = Group.all
  end

  def show
    @group
  end

  def destroy
  end

end
