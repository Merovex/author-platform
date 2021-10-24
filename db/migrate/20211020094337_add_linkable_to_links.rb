class AddLinkableToLinks < ActiveRecord::Migration[7.0]
  def change
    add_column :links, :linkable_id, :integer
    add_column :links, :linkable_type, :string
  end
  add_index :pictures, [:linkable_type, :linkable_id]
end
