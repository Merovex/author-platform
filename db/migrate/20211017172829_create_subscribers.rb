class CreateSubscribers < ActiveRecord::Migration[7.0]
  def change
    create_table :subscribers do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :ahoy_visit_id
      t.string :email
      t.string :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at

      t.timestamps
    end
  end
end
