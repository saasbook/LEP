# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = {first_name: 'Jane', 
		last_name: 'Doe', 
		sid: '12345678', 
		email: 'example@gmail.com',
		academic_title: 'Undergraduate',
		major: 'Computer Science', 
		residency: 'Domestic', 
		gender: 'Female', 
		gender_preference: 'Female',
		fluent_languages: 'English', 
		lang_additional_info: '',
		first_lang_preference: 'French', 
		first_lang_proficiency: 'elementary', 
		second_lang_preference: 'Arabic', 
		second_lang_proficiency: 'elementary',
		time_preference: 'Monday', 
		time_additional_info: '',
		user_motivation: 'I will be studying abroad.', 
		user_plan: 'I will set a regular meeting time with them.',
		admin: false,
		application: true}

shana = {first_name: 'Shana',
    email: 'shanahu@berkeley.edu',
    admin: false}

user27 = {first_name: 'Robyn', 
		last_name: 'Zhang', 
		sid: '22223333', 
		email: 'robynz@berkeley.edu',
		academic_title: 'Undergraduate',
		major: 'Computer Science', 
		residency: 'Domestic', 
		gender: 'Female', 
		gender_preference: 'Female',
		fluent_languages: 'English', 
		lang_additional_info: '',
		first_lang_preference: 'Chinese', 
		first_lang_proficiency: 'intermediate', 
		second_lang_preference: 'Spanish', 
		second_lang_proficiency: 'elementary',
		time_preference: 'Monday', 
		time_additional_info: '',
		user_motivation: 'I will be studying abroad.', 
		user_plan: 'I will set a regular meeting time with them.',
		admin: false,
		application: true}

admin = { first_name: 'Admin', admin: true}
users = User.create!([user1, shana, user27, admin])

