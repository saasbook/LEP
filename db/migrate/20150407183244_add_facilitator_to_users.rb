class AddFacilitatorToUsers < ActiveRecord::Migration
  def change
    add_column :users, :facilitator, :boolean
  end
end
