class Pair < ActiveRecord::Base

  serialize :members, Array
  serialize :languages, Array

end
