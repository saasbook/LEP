class CreatePairs < ActiveRecord::Migration
  def change
    create_table :pairs do |t|
      t.string :members
      t.string :languages
      t.timestamps
    end
  end
end
