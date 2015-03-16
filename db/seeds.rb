# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


admin_pair = Pair.create({name: "Admin Pair", languages: 'Null'})
student_pair = Pair.create({name: "eng & arabic pair", languages: 'Arabic, English'})


shana = {pair_id: student_pair.id,
				first_name: 'Shana',
    		email: 'shanahu@berkeley.edu',
    		admin: true}

jane = {pair_id: student_pair.id,
		first_name: 'Jane', 
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
		}

robyn = {pair_id: student_pair.id,
		first_name: 'Robyn', 
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
		}

admin = {pair_id: admin_pair.id, 
	first_name: 'Admin', 
	admin: true }

admin2 = {pair_id: admin_pair.id, 
	first_name: 'adminmeister', 
  email: 'swchoi727@berkeley.edu', 
  admin: true }

users = User.create!([jane, robyn, shana, admin, admin2])

