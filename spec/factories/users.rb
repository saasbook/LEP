FactoryGirl.define do
  factory :user do |u|
    u.id "1"
    u.first_name "Bob"
    u.last_name "Engineer"
    u.sid "12345678"
    u.email "example@gmail.com"
    u.academic_title "DEFAULT"
    u.major "MAJOR"
    u.residency "DEFAULT"
    u.gender "GENDER"
    u.gender_preference "DEFAULT"
    u.fluent_languages ["english"]
    u.fluent_languages_other "DEFAULT"
    u.lang_additional_info "DEFAULT"
    u.first_lang_preference "DEFAULT"
    u.first_lang_proficiency "DEFAULT"
    u.second_lang_preference "DEFAULT"
    u.second_lang_proficiency "DEFAULT"
    u.group_leader 'No'
    u.time_preference ["monday"]
    u.hours_per_week "0"
    u.user_motivation "DEFAULT"
    u.user_plan "DEFAULT"
    u.admin false
    u.active true
    u.facilitator false
    u.group_language "DEFAULT"
  end
end
