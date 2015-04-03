class User < ActiveRecord::Base

  serialize :fluent_languages
  serialize :first_lang_preference
  serialize :second_lang_preference 
  serialize :time_preference 
  
  # http://railscasts.com/episodes/362-exporting-csv-and-excel?view=asciicast
  def self.to_csv
    CSV.open('script/newsheet.csv', 'w') do |csv|
      csv << column_names
      User.all.each do |user|
        if not user.admin
          csv << user.attributes.values_at(*column_names)
        end
      end
    end
  end

end



