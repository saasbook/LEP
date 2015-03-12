class CreateGroup < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :members
      t.string :languages
      t.timestamps
    end
  end
end
