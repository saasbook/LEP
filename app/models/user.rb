class User < ActiveRecord::Base

  serialize :fluent_languages, Array
  serialize :time_preference, Array
  
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
  def User.activate(id)
    user = User.find(id)
    user.update_attributes active: true 
  end

  def User.deactivate(id)
    user = User.find(id)
    user.update_attributes active: false 
  end

  def User.make_admin(id)
    user = User.find(id)
    user.update_attributes admin: true 
  end

  def User.revoke_admin(id)
    user = User.find(id)
    user.update_attributes admin: false
  end

end
