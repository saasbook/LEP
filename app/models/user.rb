class User < ActiveRecord::Base
  
  # http://railscasts.com/episodes/362-exporting-csv-and-excel?view=asciicast
  def self.to_csv
    CSV.open('script/newsheet.csv', 'w') do |csv|
      csv << column_names
      User.all.each do |user|
        csv << user.attributes.values_at(*column_names)
      end
    end
  end

end



