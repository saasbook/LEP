class AddFacilitatorToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :facilitator, :integer
  end
end
