class Group < ActiveRecord::Base

	serialize :members, Array

  def has_member?(id)
    return true if members.include?(id)
    else return false
  end

  def add_member(id)
    members.append(id)
  end

  def remove_member(id)
    members.delete(id)
  end

end
