class AdminsController < ApplicationController

  before_filter :check_admin

  def check_admin
    if params[:id] then
      @user = User.find(params[:id])
      unless session[:id] == @user.id and @user.admin
        redirect_to user_path(@user.id)
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
    #@auth = request.env['omniauth.auth']['credentials']
    #@email = request.env['omniauth.auth']['info']['email']
    #@user = User.create(params[:user])
    #redirect_to users_path #redirect to show action
  end

  def index
    @user = User.find(session[:id])
    @users = User.where(!:admin) # want to list all non-admin users
    @groups = Group.all
    @pairs = Pair.all
  end

  def activate
    @user = User.find(params[:user_id])
    User.activate(@user.id)
    flash[:warning] = "#{@user.first_name} #{@user.last_name} has been activated"
    redirect_to admins_path
  end
  
  def deactivate
    @user = User.find(params[:user_id])
    User.deactivate(@user.id)
    flash[:warning] = "#{@user.first_name} #{@user.last_name} has been deactivated"
    redirect_to admins_path
  end
  
  def make_admin
    @user = User.find(params[:user_id])
    User.make_admin(@user.id)
    flash[:warning] = "#{@user.first_name} #{@user.last_name} is now an admin"
    redirect_to admins_path
  end
  
  def revoke_admin
    @user = User.find(params[:user_id])
    User.revoke_admin(@user.id)
    flash[:warning] = "#{@user.first_name} #{@user.last_name} is no longer an admin"
    redirect_to admins_path
  end

  def make_facilitator
    @user = User.find(params[:user_id])
    User.make_facilitator(@user.id)
    flash[:warning] = "#{@user.first_name} #{@user.last_name} is now a language group facilitator"
    redirect_to admins_path
  end

  def revoke_facilitator
    @user = User.find(params[:user_id])
    User.revoke_facilitator(@user.id)
    flash[:warning] = "#{@user.first_name} #{@user.last_name} is no longer a language group facilitator"
    redirect_to admins_path
  end

  def edit_group
    @pair = Pair.find(params[:pair_id])
  end

  def show
  end

  def edit
  end

  def destroy
  end

  def show_pair
    @user = User.find(params[:id])
    @pair = Pair.find(params[:pair_id])
    ids = [@pair.member1, @pair.member2, @pair.member3]
    @members = {}
    ids.each do |id|
      if id.nil? || id.empty?
        @members[id] = 'None'
      else
        @members[id] = User.find_name_by_id(id.to_i)
      end
    end
  end

  # controller action that should call pairing algorithm
  def pairing
    User.to_csv()
    res = `python script/lep_pairing.py`
    flash[:notice] = 'Pairs have been generated.'
    Pair.generate_pairs()
    redirect_to admins_path
  end

end
