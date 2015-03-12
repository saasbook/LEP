class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups
    add_column :groups, :members, :array
    add_column :groups, :languages, :array
  end
end
