class CreatePairs < ActiveRecord::Migration
  def change
    create_table :pairs do |t|
      t.string :name
      t.string :languages

      t.timestamps
    end
  end
end
