class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :sid, :email
  attr_accessible :academic_title, :major, :residency, :gender, :gender_preference
  attr_accessible :fluent_languages, :lang_additional_info
  attr_accessible :first_lang_preference, :first_lang_proficiency, :second_lang_preference, :second_lang_proficiency
  attr_accessible :time_preference, :time_additional_info
  attr_accessible :user_motivation, :user_plan
end