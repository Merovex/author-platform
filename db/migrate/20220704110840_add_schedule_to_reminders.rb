class AddScheduleToReminders < ActiveRecord::Migration[7.0]
  def change
    add_column :reminders, :frequency, :string, default: 'daily'
    add_column :reminders, :days, :string
    # add_column :reminders, :time_of_day, :string, default: '09:00'
    add_column :reminders, :week_start, :integer, default: 0
  end
end
