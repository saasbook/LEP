class AddGroupLanguageToUser < ActiveRecord::Migration
  def change
    add_column :users, :group_language, :string
  end
end
