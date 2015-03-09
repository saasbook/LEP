class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    #@auth = request.env['omniauth.auth']['credentials']
    #@email = request.env['omniauth.auth']['info']['email']
    @user = User.new(user_params)
    #@user = User.create!(params[:user])
    @user.application = true
    @user.is_admin = false
    #redirect_to user_path(params[:id]) #redirect to show action
    redirect_to user_path(@user)
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
    print "*****************EMAIL******************", email
    @user = User.where(:email => email)
    print "*****************FOUND EMAIL******************", @user.pluck(:email)
    print "***********************************"
    #no application yet
    if @user.blank?
      redirect_to new_user_path
    else
      is_admin = @user.pluck(:is_admin)
      redirect_to user_path(params[:id]) if not is_admin
      #redirect_to admin_path if is_admin 
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :sid, :email, :academic_title, :major, :residency,
                                :gender, :gender_preference, :fluent_languages, :lang_additional_info,
                                :first_lang_preference, :first_lang_proficiency, :second_lang_preference,
                                :second_lang_proficiency, :time_preference, :time_additional_info, 
                                :user_motivation, :user_plan, :is_admin, :application)
  end

end


















