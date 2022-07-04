class MakeStartTimeString < ActiveRecord::Migration[7.0]
  def change
    change_column :reminders, :start_time, :string
  end
end
