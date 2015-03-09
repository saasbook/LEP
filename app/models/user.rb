class User < ActiveRecord::Base
  attr_accessor :is_admin
  attr_accessor :first_name, :last_name, :sid, :email
  attr_accessor :academic_title, :major, :residency, :gender, :gender_preference
  attr_accessor :fluent_languages, :lang_additional_info
  attr_accessor :first_lang_preference, :first_lang_proficiency, :second_lang_preference, :second_lang_proficiency
  attr_accessor :time_preference, :time_additional_info
  attr_accessor :user_motivation, :user_plan
end
