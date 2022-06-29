# Migration responsible for creating a table with notifications
class CreateActivityNotificationTables < ActiveRecord::Migration[7.0]
  # Create tables
  def change
    
    create_table :notifications do |t|
      t.belongs_to :target,     polymorphic: true, index: true, null: false
      t.belongs_to :notifiable, polymorphic: true, index: true, null: false
      t.string     :key,                                        null: false
      t.belongs_to :group,      polymorphic: true, index: true
      t.integer    :group_owner_id,                index: true
      t.belongs_to :notifier,   polymorphic: true, index: true
      t.text       :parameters
      t.datetime   :opened_at

      t.timestamps null: false
    end

    # drop_table :subscriptions # Dropping legacy in favor of this model
    # We will want to drop the legacy subscriptions table eventually.
    create_table :notifications_subscriptions do |t|
      t.belongs_to :target,     polymorphic: true, index: true, null: false
      t.string     :key,                           index: true, null: false
      t.boolean    :subscribing,                                null: false, default: true
      t.boolean    :subscribing_to_email,                       null: false, default: true
      t.datetime   :subscribed_at
      t.datetime   :unsubscribed_at
      t.datetime   :subscribed_to_email_at
      t.datetime   :unsubscribed_to_email_at
      t.text       :optional_targets

      t.timestamps null: false
    end
    add_index :notifications_subscriptions, [:target_type, :target_id, :key], unique: true, name: 'index_subscriptions_on_target_type_id_and_key'
  end
end
