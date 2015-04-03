class AddGroupleaderToUsers < ActiveRecord::Migration
  def change
    add_column :users, :group_leader, :string
  end
end
