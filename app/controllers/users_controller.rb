class UsersController < ApplicationController

  def new
  end

  def create
  	@user = User.create(params[:user])
  	redirect_to users_path #redirect to show action
  end

  def index
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
  end

  def destroy
  end

end
