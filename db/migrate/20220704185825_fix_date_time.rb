class FixDateTime < ActiveRecord::Migration[7.0]
  def change
    remove_column :reminders, :start_time
    add_column :reminders, :start_time, :datetime
  end
end
