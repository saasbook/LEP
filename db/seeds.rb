# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@user = User.create([{first_name: 'Jane', 
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
						user_plan: 'I will set a regular meeting time with them.'},
            
            { first_name: 'Admin', is_admin: true}])


