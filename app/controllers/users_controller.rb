class UsersController < ApplicationController

  before_filter :check_user
  before_filter :check_email, :except => [:home, :create, :invalid]

  def check_email
    #Check that the user is properly logged in
    if session[:invalid_email]
      flash[:warning] = "#{session[:invalid_email]} is not a valid email. \n Please Logout and reauthenticate with a Berkeley email address."
      redirect_to users_invalid_path
    end
  end

  def check_user
    if params[:id] && session[:id]
      @user = User.where(:id => session[:id])
      @admin = @user.pluck(:admin)[0]
      if ((params[:id].to_s != session[:id].to_s) && (!@admin))
        redirect_to user_path(session[:id])
      end
    end
  end

  def new
    @user = User.new
  end

  def create
    #@auth = request.env['omniauth.auth']['credentials']
    #@email = request.env['omniauth.auth']['info']['email']
    @user = User.new(user_params)
    @user.admin = false
    @user.active = true
    @user.save
    session[:id] = @user.id
    redirect_to user_path(@user)
  end

  def index
    @users = User.all
  end

  def show
    @id = params[:id]
    @user = User.find(@id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def activate
    @user = User.find(params[:id])
    @user.update_attributes active: true
    flash[:warning] = "#{@user.first_name} #{@user.last_name}'s account has been reactivated."
    redirect_to user_path(@user)
  end

  def deactivate
    @user = User.find(params[:id])
    @user.update_attributes active: false
    flash[:warning] = "#{@user.first_name} #{@user.last_name}'s account has been deactivated."
    redirect_to user_path(@user)
  end

  def destroy
    if User.find(session[:id]).admin then
      @user = User.find(params[:id])
      @user.destroy
      redirect_to admins_path
    else
      redirect_to user_path(session[:id])
    end
  end

  def is_admin?
    print @user.pluck(:admin)
    return @user.pluck(:admin)[0]
  end

  def is_active?
    return @user.pluck(:active)[0]
  end

  def home
    @email = request.env['omniauth.auth']['info']['email']
    if @email =~ /.*berkeley.edu$/
      @user = User.where(:email => @email)
      #no application yet
      if @user.blank?
        redirect_to new_user_path
      else
        @id = @user.pluck(:id)[0]
        session[:id] = @id
        redirect_to admin_path(@id) if is_admin?
        redirect_to user_path(@id) if not is_admin?
      end
    else
      flash[:warning] = "#{@email} is not a valid email. \n Please Logout and reauthenticate with a Berkeley email address."
      session[:invalid_email] = @email
      redirect_to users_invalid_path
    end
  end


  private

  #rails 4 idiosyncracy; helper method for create
  def user_params
    params.require(:user).permit(:id, :first_name, :last_name, :sid, :email, :academic_title, :major, :residency,
                                :gender, :gender_preference, :fluent_languages, :lang_additional_info,
                                :first_lang_preference, :first_lang_proficiency, :second_lang_preference,
                                :second_lang_proficiency, :time_preference, :time_additional_info, 
                                :user_motivation, :user_plan, :admin, :active)
  end

end
