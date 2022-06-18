class AddIsWipToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :is_wip, :boolean
    add_index :books, :is_wip
    add_index :books, :slug
    add_index :series, :slug
    add_index :subscriptions, :slug
    add_index :subscriptions, :posts
    add_index :subscriptions, :books
    add_index :writing_entries, :wrote_on
    add_index :writing_goals, :slug
  end
end
