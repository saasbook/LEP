class CreatePairs < ActiveRecord::Migration
  def change
    create_table :pairs do |t|
      t.string :member1
      t.string :member2
      t.string :member3
      t.string :languages
      t.timestamps
    end
  end
end
