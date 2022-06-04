class AddLinkableToLinks < ActiveRecord::Migration[7.0]
  def change
    add_column :links, :linkable_id, :integer
    add_column :links, :linkable_type, :string
    add_index :links, [:linkable_type, :linkable_id]
  end
end
