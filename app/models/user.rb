class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :sid. :email
  attr_accessible :academic_title, :major, :residency, :gender
  attr_accessible :fluent_languages, :teach_languages, :learn_languages
  attr_accessible :time_preference, :gender_preference, :additional_info

end
