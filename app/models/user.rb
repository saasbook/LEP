class User < ActiveRecord::Base
  def has_application?(email)
	 @user = User.where(email: email)
	 @user.application
  end

end



