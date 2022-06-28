class RemoveSlugFromBuckets < ActiveRecord::Migration[7.0]
  def change
    remove_column :buckets, :slug
  end
end
