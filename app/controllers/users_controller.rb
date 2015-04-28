class UsersController < ApplicationController

  before_filter :check_user
  before_filter :check_email, :except => [:home, :create, :invalid]

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
    @user.facilitator = false
    @user.save
    session[:id] = @user.id
    redirect_to user_path(@user)
  end

  def index
    @users = User.all
    redirect_to admins_path
  end

  def show
    @id = params[:id]
    @user = User.find(@id)
    #groupid
    @groupID = nil
    @myGroup = nil
    Group.all.each do |group|
      if group.facilitator == @user.id
        @myGroup = group
        @groupID = group.id
      end
    end

    # case where leaders lead more than one group
    # @groups = Array.new
    # Group.all.each do |group|
    #   if group.facilitator == @user.id
    #     @groups.push(group)
    #   end
    # end
  end

  def edit
    if before_deadline
      @user = User.find(params[:id])
    else
      flash[:warning] = "The deadline has passed to edit applications."
      redirect_to user_path(@user)
    end
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
      @user = User.find(params[:id]) #might need to be user_id
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

  # def is_active?
  #   return @user.pluck(:active)[0]
  # end

  # def is_facilitator?
  #   return @user.pluck(:facilitator)[0]
  # end

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

  # check that the application is not being created after the deadline
  def before_deadline
    return Date.today < Date.strptime(User::APPLICATION_DEADLINE, "%m/%d/%Y")
  end


  private

  #rails 4 idiosyncracy; helper method for create
  def user_params
    params.require(:user).permit(:id, :first_name, :last_name, :sid, :email, :academic_title, :major, :residency,
                                :gender, :gender_preference, :fluent_languages, :fluent_languages_other, :lang_additional_info,
                                :first_lang_preference, :first_lang_proficiency, :second_lang_preference,
                                :second_lang_proficiency, :group_leader, :time_preference, :hours_per_week, 
                                :user_motivation, :user_plan, :admin, :active, :facilitator).tap do |whitelisted|          
                                    if not params[:user][:fluent_languages_other].nil? and params[:user][:fluent_languages_other] != ""
                                      params[:user][:fluent_languages][-1] = params[:user][:fluent_languages_other].downcase # add the user's entry for "other" to our fluent_languages list
                                    end
                                    whitelisted[:fluent_languages] = params[:user][:fluent_languages]
                                    if params[:user][:first_lang_preference] == "other"
                                      whitelisted[:first_lang_preference] = params[:first_lang_preference_other].downcase
                                    else
                                      whitelisted[:first_lang_preference] = params[:user][:first_lang_preference]
                                    end
                                    if params[:user][:second_lang_preference] == "other"
                                      whitelisted[:second_lang_preference] = params[:second_lang_preference_other].downcase
                                    else
                                      whitelisted[:second_lang_preference] = params[:user][:second_lang_preference]
                                    end
                                    whitelisted[:time_preference] = params[:user][:time_preference]
    end
  end

end
