class ApplicationController < ActionController::Base
  protect_from_forgery

  def check_email
    # Check that the user is properly logged in
    if session[:invalid_email]
      flash[:warning] = "#{session[:invalid_email]} is not a valid email. \n Please Logout and reauthenticate with a Berkeley email address."
      redirect_to users_invalid_path
    end
  end
  
end
