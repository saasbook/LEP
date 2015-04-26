class AddTimesheetModel < ActiveRecord::Migration
  def change
    create_table :timesheets do |t|
      t.integer :user_id
      t.string :language
      t.datetime :date
      t.integer :hours
  end
end
