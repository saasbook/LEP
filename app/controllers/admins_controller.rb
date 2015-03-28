class AdminsController < ApplicationController

  before_filter :check_admin

  def check_admin
    if params[:id] then
      @user = User.find(params[:id])
      unless session[:id] == @user.id and @user.admin
        redirect_to user_path
      end
    else
      @id = session[:id]
      unless User.find(@id).admin
        redirect_to user_path :id => @id
      end
    end
  end

  def new
  end

  def create
    @auth = request.env['omniauth.auth']['credentials']
    @email = request.env['omniauth.auth']['info']['email']
    #@user = User.create(params[:user])
    #redirect_to users_path #redirect to show action
  end

  def index
    @user = User.find(session[:id])
    @users = User.where(!:admin) # want to list all non-admin users
    @groups = Group.all
  end

  def show
  end

  def edit
  end

  def destroy
  end

  # controller action that should call pairing algorithm
  def pair
  end

end
