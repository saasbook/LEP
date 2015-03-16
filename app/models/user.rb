class User < ActiveRecord::Base
	belongs_to :pair
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # before_action :authenticate_user!
  
  def has_application?(email)
	 @user = User.where(email: email)
	 @user.application
  end

end



