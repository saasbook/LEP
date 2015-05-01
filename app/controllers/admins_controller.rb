class AdminsController < ApplicationController

  before_filter :check_admin

  def check_admin
    if params[:id] then
      check_params
    else
      check_session
    end
  end

  def check_params
   @user = User.find(params[:id])
    unless session[:id] == @user.id and @user.admin
      redirect_to user_path(@user.id)
    end
  end

  def check_session
    @id = session[:id]
    if !@id.nil?
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
    redirect_to admin_path
  end

  def new
  end

  def create
  end

  def index
    @user = User.find(session[:id]) if !(session[:id].nil?)

    @admins = User.where(:admin => true)
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

  def modify_user(action, flash_msg)
    @user = User.find(params[:user_id])
    User.send(action, @user.id)
    flash[:warning] = "#{@user.first_name} #{@user.last_name} " + flash_msg
    redirect_to admins_path
  end
  
  def activate
    modify_user("activate", "has been activated")
  end
  
  def deactivate
    modify_user("deactivate", "has been deactivated")
  end
  
  def make_admin
    modify_user("make_admin", "is now an admin")
  end
  
  def revoke_admin
    modify_user("revoke_admin", "is no longer an admin")
  end

  def make_facilitator
    modify_user("make_facilitator", "is now a language group facilitator")
  end

  def revoke_facilitator
    modify_user("revoke_facilitator", "is no longer a language group facilitator")
  end

  #def edit_group
  #  @pair = Pair.find(params[:pair_id])
  #end

  def show
  end

  def edit
  end

  def destroy
  end
  
  # params = params[:admin]
  def get_emails(params)
    return [params[:email1].to_s, params[:email2].to_s, params[:email3].to_s]
  end

  # params = params[:admin]
  def get_languages(params)
    return [params[:lang1], params[:lang2]]
  end

  # def check_potential_members(members)
  #   members.each do |member|
  #     user = User.find(member)
  #     return false if (user.pair_id != 0 || user.active)
  #   end
  #   return true
  # end

  def check_potential_members(members)
    count = 0 
    members.each do |member|
      if member.nil?
        count += 1
      end
    end
    return count
    #return false if count > 1
    #return true
  end

  def create_pair
    @user = User.find(params[:id])
    email1, email2, email3 = get_emails(params[:admin])
    languages = get_languages(params[:admin])
    if !email1.empty?
      user1 = User.where(email: email1).first
    end
    if !email2.empty?
      user2 = User.where(email: email2).first
    end
    if !email3.empty?
      user3 = User.where(email: email3).first
    end

    num_invalid = check_potential_members([user1, user2, user3])

    if num_invalid == 0
      @pair = Pair.create(member1: user1.id, 
                          member2: user2.id, 
                          member3: user3.id,
                          languages: languages)
      redirect_to admin_show_pair_path(id: @user.id, pair_id: @pair.id)
    elsif num_invalid == 1
      @pair = Pair.create(member1: user1.id, 
                          member2: user2.id, 
                          #member3: user3.id,
                          languages: languages)
      redirect_to admin_show_pair_path(id: @user.id, pair_id: @pair.id)
    else 
      flash[:notice] = 'Pair could not be formed'
      redirect_to admins_path
    end

    # if (check_potential_members([member1, member2, member3]))
    #   @pair = Pair.create(member1: member1, member2: member2,
    #                     member3: member3, languages: languages)
    #   redirect_to admin_show_pair_path(id: @user.id, pair_id: @pair.id)
    # else
    #   flash[:notice] = 'Pair could not be formed'
    #   redirect_to admins_path
    # end
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

  def show_user
    @admin = User.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def modify_pair(action, flash)
    @user = User.find(params[:id])
    @pair = Pair.find(params[:pair_id])  
    user = User.find(params[:user_id])
    Pair.send(action, @pair.id, user.id)
    #flash[:notice] = "#{user.first_name} #{user.last_name} #{flash} #{@pair.id.to_s}"
    redirect_to admin_show_pair_path(:id => @user.id, :pair_id => @pair.id)
  end

  def remove_from_pair
    #@user = User.find(params[:id])
    #@pair = Pair.find(params[:pair_id])  
    #user = User.find(params[:user_id])
    #Pair.remove_user_from_pair(@pair.id, user.id)
    flash_msg = " has been deleted from pair "
    modify_pair('remove_user_from_pair', flash_msg)
    #redirect_to admin_show_pair_path(:id => @user.id, :pair_id => @pair.id)
  end

  def add_to_pair
    #@user = User.find(params[:id])
    #@pair = Pair.find(params[:pair_id])
    #user = User.find(params[:user_id])
    #Pair.add_user_to_pair(@pair.id, user.id)
    flash_msg = " has been added to pair "
    modify_pair('add_user_to_pair', flash_msg)
    #redirect_to admin_show_pair_path(:id => @user.id, :pair_id => @pair.id)
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
