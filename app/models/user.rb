class User < ActiveRecord::Base

  serialize :fluent_languages, Array
  serialize :time_preference, Array

  APPLICATION_DEADLINE = Date.tomorrow.strftime("%m/%d/%Y").to_s # by default, the application is due tomorrow

  def self.set_application_deadline(deadline)
    APPLICATION_DEADLINE.replace deadline # set the application deadline
  end

  # http://railscasts.com/episodes/362-exporting-csv-and-excel?view=asciicast
  def self.pairing_csv
    CSV.open('script/newsheet.csv', 'w') do |csv|
      csv << column_names
      User.all.each do |user|
        if not user.admin
          csv << user.attributes.values_at(*column_names)
        end
      end
    end
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << User.column_names
      all.each do |user|
        csv << user.attributes.values_at(*column_names)
      end
    end
  end

  # set user's pair_id attr to a pair id
  def User.set_pair_id(user_id, pair_id)
    user = User.find(user_id) 
    user.update_attributes pair_id: pair_id
  end

  def full_name
    return self.first_name + " " + self.last_name
  end

  def User.activate(id)
    user = User.find(id)
    user.update_attributes active: true 
  end

  def User.deactivate(id)
    user = User.find(id)
    user.update_attributes active: false, facilitator: false 
  end

  def User.make_admin(id)
    user = User.find(id)
    user.update_attributes admin: true 
  end

  def User.revoke_admin(id)
    user = User.find(id)
    user.update_attributes admin: false
  end

  def User.make_facilitator(id)
    user = User.find(id)
    user.update_attributes facilitator: true
  end

  def User.revoke_facilitator(id)
    user = User.find(id)
    user.update_attributes facilitator: false
  end

  def User.total_users
    return User.count
  end

  def User.total_admins
    return User.where(admin: true).count
  end

end
