class AddFluentLanguagesOtherToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fluent_languages_other, :string
  end
end
