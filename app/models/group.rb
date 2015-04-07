class Group < ActiveRecord::Base

	serialize :members, Array

end
