class AddDeletedAtToTables < ActiveRecord::Migration[7.0]
  def change
    add_column :todolists, :deleted_at, :datetime
    add_column :todos, :deleted_at, :datetime
    add_column :praises, :deleted_at, :datetime
    add_column :books, :deleted_at, :datetime
    add_column :series, :deleted_at, :datetime
    add_column :links, :deleted_at, :datetime
    add_column :posts, :deleted_at, :datetime
    add_column :pages, :deleted_at, :datetime
    add_column :subscriptions, :deleted_at, :datetime
    add_index :todolists, :deleted_at
    add_index :todos, :deleted_at
    add_index :praises, :deleted_at
    add_index :books, :deleted_at
    add_index :series, :deleted_at
    add_index :links, :deleted_at
    add_index :posts, :deleted_at
    add_index :pages, :deleted_at
    add_index :subscriptions, :deleted_at
  end
end
