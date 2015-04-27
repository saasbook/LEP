class AddPairIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :pair_id, :integer, :default => 0
  end
end
