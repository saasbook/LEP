class UsersController < ApplicationController

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
  end

  def home
    email = request.env['omniauth.auth']['info']['email']
    @user = User.where(email: email)
    #no application yet
    if @user.blank?
      redirect_to new_user_path
    else
      is_admin = @user.pluck(:is_admin)
      redirect_to user_path(id: @user.id, admin: is_admin)
    end
  end

end


















