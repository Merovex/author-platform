class MakeStartTimeString < ActiveRecord::Migration[7.0]
  def up
    change_column :reminders, :start_time, :datetime
  end
end
