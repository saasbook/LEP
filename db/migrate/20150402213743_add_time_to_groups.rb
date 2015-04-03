class AddTimeToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :time, :string
  end
end
