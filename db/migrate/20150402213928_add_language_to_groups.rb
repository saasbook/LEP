class AddLanguageToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :language, :string
  end
end
