class RenameBucketToProject < ActiveRecord::Migration[7.0]
  def change
    rename_table :buckets, :projects
    rename_column :writing_entries, :bucket_id, :project_id
    Todolist.all.each do |td|
      td.todolistable_type = 'Project' if td.todolistable_type == 'Bucket'
      td.save
    end
  end
end
