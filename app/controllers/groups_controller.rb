class GroupsController < ApplicationController
  
  def new
  end

  def create
    
  end

  def index
    @user = User.find(session[:id])
    @groups = Group.all
    @mon_groups = Group.where(day: "Monday").all
    @tues_groups = Group.where(day: "Tuesday").all
    @wed_groups = Group.where(day: "Wednesday").all
    @thurs_groups = Group.where(day: "Thursday").all
    @fri_groups = Group.where(day: "Friday").all
  end

  def show
  end

  def destroy
  end

end
