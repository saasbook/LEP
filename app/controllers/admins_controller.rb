class AdminsController < ApplicationController

  def new
  end

  def create
    @auth = request.env['omniauth.auth']['credentials']
    @email = request.env['omniauth.auth']['info']['email']
    #@user = User.create(params[:user])
    #redirect_to users_path #redirect to show action
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
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admins_path
  end


end
