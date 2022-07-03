class CreateReminders < ActiveRecord::Migration[7.0]
  def change
    create_table :reminders do |t|
      t.integer :remindable_id
      t.string :remindable_type
      t.datetime :start_time
      t.text :recurring

      t.timestamps
    end
  end
end
