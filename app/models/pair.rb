class Pair < ActiveRecord::Base

  serialize :languages, Array

  def self.generate_pairs()
    CSV.foreach('script/final_pairs.csv', headers: true) do |row|
      @member1 = row['partner1']
      @member2 = row['partner2']
      @languages = nil
      @languages = row['language(s)'].split(",") if row['language(s)'] != nil
      if self.verify_pair()
        Pair.create(:member1 => row['partner1'],
            :member2 => row['partner2'],
            :languages => languages
      )
      end
    end
  end

  def self.verify_pair()
    pair1 = Pair.where(member1: @member1) or Pair.where(member2: @member1)
    pair2 = Pair.where(member1: @member2) or Pair.where(member2: @member2)
    if pair1.nil? and pair2.nil?
      return true
    else
      return false
    end
  end

end
