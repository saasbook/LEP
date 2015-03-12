class CreateUsers < ActiveRecord::Migration
  def change
  	create_table :users do |t|
			t.string :first_name 
			t.string :last_name 
			t.string :sid
			t.string :email 
			t.string :academic_title
			t.string :major
			t.string :residency
			t.string :gender
			t.string :gender_preference  
			t.string :fluent_languages
			t.string :lang_additional_info
			t.string :first_lang_preference 
			t.string :first_lang_proficiency
			t.string :second_lang_preference
			t.string :second_lang_proficiency 
			t.string :time_preference 
			t.string :time_additional_info 
			t.string :user_motivation 
			t.string :user_plan
      t.boolean :application

			t.timestamps
		end
  end

  def up
  end

  def down
  end
end
