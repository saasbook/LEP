class GroupsController < ApplicationController
  
  def new
  end

  def create
    
  end

  def index
    @user = User.find(session[:id])
    @groups = Group.all
  end

  def show
  end

  def destroy
  end

end
