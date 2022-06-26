class RenameWritingGoalToBucket < ActiveRecord::Migration[7.0]
  def change
    rename_table :writing_goals, :buckets
    rename_column :writing_entries, :writing_goal_id, :bucket_id
  end
end
