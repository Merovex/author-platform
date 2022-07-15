class AddReminderDateTimeToReminders < ActiveRecord::Migration[7.0]
  def change
    add_column :reminders, :reminded_at, :datetime
  end
end
