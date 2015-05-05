class Group < ActiveRecord::Base

	serialize :members, Array
  # validates :members, presence: true
  validates :time, presence: true
  validates :location, presence: true
  validates :language, presence: true
  validates :day, presence: true
  # validates :info, presence: true
  # validates :facilitator, presence: true, format: { with: /\A[0-9]+\z/, message: "only allows numbers"}

  def has_member?(id)
    #return true if members.include?(id)
    #else return false
    (members.include?(id)) ? true : false
  end

  def add_member(id)
    members.append(id)
  end

  def remove_member(id)
    members.delete(id)
  end

  def get_facilitator()
    return User.find(facilitator)
  end

  def Group.total_groups
    return Group.count
  end

=begin
  def self.to_csv
    CSV.open('script/groups.csv', 'w') do |csv|
      csv << column_names
      Group.all.each do |item|
        csv << item.attributes.values_at(*column_names)
      end
    end
  end
=end

end
