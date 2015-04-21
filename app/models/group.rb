class Group < ActiveRecord::Base

	serialize :members, Array

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
  
  def self.to_csv
    CSV.open('script/groups.csv', 'w') do |csv|
      csv << column_names
      Group.all.each do |item|
        csv << item.attributes.values_at(*column_names)
      end
    end
  end

end
