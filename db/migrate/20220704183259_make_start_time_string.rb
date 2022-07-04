class MakeStartTimeString < ActiveRecord::Migration[7.0]
  def up
    add_column :reminders, :start_time, :datetime
  end
  def down
    drop_column :reminders, :start_time
  end
end
