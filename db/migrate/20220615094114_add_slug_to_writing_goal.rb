class AddSlugToWritingGoal < ActiveRecord::Migration[7.0]
  def change
    add_column :buckets, :slug, :string
  end
end
