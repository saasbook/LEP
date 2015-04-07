class GroupsController < ApplicationController
  
  def new
  end

  def create
    @group = Group.new(group_params)
    @group.save!
    redirect_to groups_path
  end

  def index
    @user = User.find(session[:id])
    @mon_groups = Group.where(day: "Monday").all
    @tues_groups = Group.where(day: "Tuesday").all
    @wed_groups = Group.where(day: "Wednesday").all
    @thurs_groups = Group.where(day: "Thursday").all
    @fri_groups = Group.where(day: "Friday").all
  end

  def show
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to groups_path
  end

  private
  def group_params
    params.require(:group).permit(:language, :day, :time, :location, :members)
  end

end
