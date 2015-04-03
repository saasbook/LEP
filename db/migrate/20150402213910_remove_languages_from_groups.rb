class RemoveLanguagesFromGroups < ActiveRecord::Migration
  def change
    remove_column :groups, :languages, :string
  end
end
