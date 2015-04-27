class GroupsController < ApplicationController

  before_filter :check_email

  def new
    @user = User.find(session[:id])
  end

  def create
    @group = Group.new(group_params)
    @group.facilitator = session[:id]
    @group.save!
    redirect_to groups_path
  end

  def edit
    @user = User.find(session[:id])
    @group = Group.find(params[:id]) 
  end

  def index
    @user = User.find(session[:id])
    @mon_groups = Group.where(:day => 'Monday').all
    @tues_groups = Group.where(:day => 'Tuesday').all
    @wed_groups = Group.where(:day => 'Wednesday').all
    @thurs_groups = Group.where(:day => 'Thursday').all
    @fri_groups = Group.where(:day => 'Friday').all
  end

  def manage
    #puts '*' * 50, params[:id]
    @user = User.find(session[:id])
    @groups = Group.all
  end
  
  def show
    #puts '*' * 50, params[:id]
    @group = Group.find(params[:id])
    @facilitator = @group.get_facilitator
    @user = User.find(session[:id])
  end

  def edit
    @group = Group.find(params[:id])
    @user = User.find(session[:id])
    @groups = Group.all
  end

  def update
    @group = Group.find(params[:id])
    @group.update_attributes(group_params)
    @group.save!
    redirect_to manage_groups_path
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to groups_path
  end
  
  def join
    @group = Group.find(params[:id])
    @group.add_member(session[:id])
    @group.save!
    flash[:warning] = "You have joined a language group!"
    redirect_to groups_path
  end

  def leave
    @group = Group.find(params[:id])
    @group.remove_member(session[:id])
    @group.save!
    redirect_to groups_path
  end

  private
  def group_params
    params.require(:group).permit(:language, :day, :time, :location, :members, :facilitator, :info)
  end

end
