class AddCategoriesToSubscription < ActiveRecord::Migration[7.0]
  def change
    add_column :subscriptions, :posts, :string
    add_column :subscriptions, :books, :string
  end
end
