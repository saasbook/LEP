class AddDayToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :day, :string
  end
end
