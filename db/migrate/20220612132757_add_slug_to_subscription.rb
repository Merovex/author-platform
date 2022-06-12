class AddSlugToSubscription < ActiveRecord::Migration[7.0]
  def change
    add_column :subscriptions, :slug, :string
  end
end
