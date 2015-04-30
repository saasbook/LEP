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

  def analytics
  end

  def set_application_deadline
    deadline = params["deadline"]
    User.set_application_deadline(deadline) # set the application deadline
    # flash[:notice] = "Application Successfully Updated"
    redirect_to admin_path
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
    @user = User.find(session[:id]) if !(session[:id].nil?)

    @admins = User.where(:admin)
    print "************************************8", @admins
    if params[:sort] then
      @admins = @admins.reorder(params[:sort])
    end
    @groups = Group.all
  end

  def users
    @user = User.find(session[:id]) if !(session[:id].nil?)
    @users = User.where(!:admin) # want to list all non-admin users
    if params[:sort] then
      @users = @users.reorder(params[:sort])
    end
  end

  def pairs
    @user = User.find(session[:id]) if !(session[:id].nil?)
    @pairs = Pair.all
    if params[:sort] then
      @pairs = @pairs.reorder(params[:sort])
    end
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
        user = User.find(id)
        @members[id] = "#{user.first_name} #{user.last_name}"
      end
    end
  end

  def view_users
    @pair = Pair.find(params[:pair_id])
    @user = User.find(params[:id])
    @users = User.where(:admin => false, :pair_id => 0)
    @users_hash = {}
    @users.each do |user| 
      @users_hash[user.id] = "#{user.first_name} #{user.last_name}"
    end
  end

  def remove_from_pair
    @user = User.find(params[:id])
    @pair = Pair.find(params[:pair_id])  
    user = User.find(params[:user_id])
    Pair.remove_user_from_pair(@pair.id, user.id)
    flash[:notice] = "#{user.first_name} #{user.last_name}  has been deleted from pair #{@pair.id}"
    redirect_to admin_show_pair_path(:id => @user.id, :pair_id => @pair.id)
  end

  def add_to_pair
    @pair = Pair.find(params[:pair_id])
    user = User.find(params[:user_id])
    @user = User.find(params[:id])
    Pair.add_user_to_pair(@pair.id, user.id)
    flash[:notice] = "#{user.first_name} #{user.last_name} has been added to pair #{@pair.id}"
    redirect_to admin_show_pair_path(:id => @user.id, :pair_id => @pair.id)
  end

  # controller action that should call pairing algorithm
  def pairing
    User.pairing_csv()
    res = `python script/lep_pairing.py`
    flash[:notice] = 'Pairs have been generated.'
    Pair.generate_pairs()
    redirect_to admins_path
  end

  def download_users
    respond_to do |format|
      format.html
      format.csv { send_data User.to_csv, :filename => 'users.csv'
    }
    end
    
  end

  def download_pairs
    @pairs = Pair.all
    respond_to do |format|
      format.html
      format.csv { send_data Pair.to_csv, :filename => 'pairs.csv' 
    }
    end
  end

end
