class User < ActiveRecord::Base

  serialize :fluent_languages, Array
  serialize :time_preference, Array

  validates :first_name, presence: true
  validates :email, presence: true, 
                    uniqueness: {:case_sensitive => true}
  validates :sid, presence: true, 
                  format: { with: /\A[0-9]+\z/, message: "only allows numbers"},
                  length: { is: 8},
                  uniqueness: true

  # validates :last_name, presence: true
  # validates :academic_title, presence: true
  # validates :major, presence: true
  # validates :residency, presence: true
  # validates :gender, presence: true
  # validates :gender_preference, presence: true
  # validates :fluent_languages, presence: true
  # validates :first_lang_preference, presence: true
  # validates :first_lang_proficiency, presence: true
  # validates :second_lang_preference, presence: true
  # validates :second_lang_proficiency, presence: true
  # validates :group_leader, presence: true
  # validates :time_preference, presence: true
  validates :hours_per_week, presence: true
                             format: /\A^([01]?[0-9]|2[0-3])\Z/
  # validates :user_motivation, presence: true
  # validates :user_plan, presence: true


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

  def User.full_name(id)
    user = User.find(id) if !id.empty?
    return "#{user.first_name} #{user.last_name}" if !(user.nil?)
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
    return User.where(admin: false).count
  end

  def User.get_users
    return User.where(admin: false)
  end

  def User.total_admins
    return User.where(admin: true).count
  end

end
