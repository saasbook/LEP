# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

jane = {first_name: 'Jane', 
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
		hours_per_week: '1',
		user_motivation: 'I will be studying abroad.', 
		user_plan: 'I will set a regular meeting time with them.',
		admin: false,
		}

shana = {first_name: 'Shana',
    email: 'shanahu@berkeley.edu',
    admin: true}

robyn = {first_name: 'Robyn', 
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
		hours_per_week: '2',
		user_motivation: 'I will be studying abroad.', 
		user_plan: 'I will set a regular meeting time with them.',
		admin: false,
		active: true
		}

admin = { first_name: 'Admin', admin: true }

admin2 = { first_name: 'adminmeister', 
  		sid: '223333', 
		email: 'swchoi727@berkeley.edu',
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
		hours_per_week: '2',
		user_motivation: 'I will be studying abroad.', 
		user_plan: 'I will set a regular meeting time with them.',
		active: true,
    admin: true 
}

jasonadmin = { first_name: 'Jason', last_name: 'Jia', email: 'jasonjia@berkeley.edu', admin: true }
users = User.create!([jane, shana, robyn, admin2])

