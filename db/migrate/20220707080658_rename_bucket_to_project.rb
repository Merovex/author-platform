class RenameBucketToProject < ActiveRecord::Migration[7.0]
  def change
    rename_table :buckets, :projects
    rename_column :writing_entries, :bucket_id, :project_id
  end
end
