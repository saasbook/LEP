class ApplicationController < ActionController::Base
  protect_from_forgery

  def check_email
    # Check that the user is properly logged in
    if session[:invalid_email]
      flash[:warning] = "#{session[:invalid_email]} is not a valid email. \n Please Logout and reauthenticate with a Berkeley email address."
      redirect_to users_invalid_path
    end
  end

  def check_user
    # Check that the user can access the appropriate user page
    if params[:id] && session[:id]
      if (!verify_access)
        redirect_to user_path(session[:id])
      end
    end
  end

  def verify_access
    @user = User.where(:id => session[:id])
    return false if ((params[:id].to_s != session[:id].to_s) && !is_admin?)
    else return true
  end

  def is_admin?
    return @user.pluck(:admin)[0]
  end

end
