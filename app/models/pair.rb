class Pair < ActiveRecord::Base

  serialize :languages, Array

  # true if s is nil or empty
  # false otherwise
  def self.check_nil_or_empty(s)
    return (s.nil? || s.empty?) ? true : false
  end

  def self.remove_user_from_pair(pair_id, user_id)
    pair = Pair.find(pair_id)
    user_id = user_id.to_s
    if pair.member1 == user_id
      pair.member1 = ''
    elsif pair.member2 == user_id
      pair.member2 = ''
    elsif pair.member3 == user_id
      pair.member3 = ''
    end
    pair.save
  end

  def self.add_user_to_pair(pair_id, user_id)
    pair = Pair.find(pair_id)
    if Pair.check_nil_or_empty(pair.member1)
      pair.member1 = user_id.to_s
    elsif Pair.check_nil_or_empty(pair.member2)
      pair.member2 = user_id.to_s
    elsif Pair.check_nil_or_empty(pair.member3)
      pair.member3 = user_id.to_s
    end
    pair.save
  end

  def self.generate_pairs()
    CSV.foreach('script/final_pairs.csv', headers: true) do |row|
      @member1 = row['partner1']
      @member2 = row['partner2']
      @languages = nil
      @languages = row['language(s)'].split(",") if row['language(s)'] != nil
      if Pair.verify_pair()
        Pair.create(:member1 => row['partner1'],
            :member2 => row['partner2'],
            :member3 => '',
            :languages => @languages
        )
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

end
