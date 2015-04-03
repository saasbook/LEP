class Pair < ActiveRecord::Base

  has_many :users, dependent: :nullify

  serialize :languages, Array

end
