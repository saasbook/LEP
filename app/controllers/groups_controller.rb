class GroupsController < ApplicationController
  
  def new
  end

  def create
    @group = Group.new(group_params)
    redirect_to group_path(@group)
  end

  def index
    @groups = Group.all
  end

  def edit
    @group = Group.find(params[:id])
  end

  def show
    @group = Group.find(params[:id])
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to group_path
  end

  def group_params
    params.require(:group).permit(:id, :languages)
  end

end
