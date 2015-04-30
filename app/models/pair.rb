class Pair < ActiveRecord::Base

  serialize :languages, Array

  # true if s is nil or empty
  # false otherwise
  def self.check_nil_or_empty(s)
    return (s.nil? || s.empty?) ? true : false
  end

  def get_languages
    list = "#{self.languages[0].delete! "'"}"
    for i in 1..self.languages.length-1
      list += ", " + "#{self.languages[i].delete! "'"}"
    end
    return list
  end

  def has_member?(id)
    members = [self.member1, self.member2, self.member3]
    members.include?(id) ? true : false
  end

  def self.remove_user_from_pair(pair_id, user_id)
    @pair = Pair.find(pair_id)
    @user = User.find(user_id)
    user_id = user_id.to_s
    if (@user.pair_id == pair_id.to_i)
      if @pair.member1 == user_id
        @pair.update_attributes(:member1 => '')
      elsif @pair.member2 == user_id
        @pair.update_attributes(:member2 => '')
      elsif @pair.member3 == user_id
        @pair.update_attributes(:member3 => '')
      end
      #@pair.save
      User.set_pair_id(user_id, 0)
    end
  end

  def self.add_user_to_pair(pair_id, user_id)
    @pair = Pair.find(pair_id)
    @user = User.find(user_id)
    # only add user if user is not in a pair
    if (@user.pair_id == 0)
      if Pair.check_nil_or_empty(@pair.member1)
        @pair.update_attributes(:member1 => user_id.to_s)
      elsif Pair.check_nil_or_empty(@pair.member2)
        @pair.update_attributes(:member2 => user_id.to_s)
      elsif Pair.check_nil_or_empty(@pair.member3)
        @pair.update_attributes(:member3 => user_id.to_s)
      end
      #@pair.save
      User.set_pair_id(user_id, pair_id)
    end
  end

  def self.generate_pairs()
    CSV.foreach('script/final_pairs.csv', headers: true) do |row|
      @member1 = row['partner1']
      @member2 = row['partner2']
      @languages = nil
      @languages = row['language(s)'].split(",") if row['language(s)'] != nil
      if Pair.verify_pair()
        @pair = Pair.create(:member1 => @member1,
            :member2 => @member2,
            :member3 => '',
            :languages => @languages
        )
        member1 = User.set_pair_id(@member1, @pair.id) if @member1
        member2 = User.set_pair_id(@member2, @pair.id) if @member2
      end
    end
  end

  def self.verify_pair()
    pair1 = Pair.where(member1: @member1) or Pair.where(member2: @member1)
    pair2 = Pair.where(member1: @member2) or Pair.where(member2: @member2)
    if pair1.nil? and pair2.nil?
      return false
    else
      return true
    end
  end

  def Pair.total_pairs
    return Pair.count
  end

  def Pair.to_csv
    CSV.generate do |csv|
      csv << Pair.column_names
      all.each do |pair|
        csv << pair.attributes.values_at(*column_names)
      end
    end
  end

end
