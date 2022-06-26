class AddWritingGoalToWritingEntries < ActiveRecord::Migration[7.0]
  def change
    add_reference :writing_entries, :bucket, null: false, foreign_key: true
  end
end
