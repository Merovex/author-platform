class CreateClicks < ActiveRecord::Migration[7.0]
  def change
    create_table :clicks do |t|
      t.references :user, null: true, foreign_key: true
      t.integer :clickable_id
      t.string :clickable_type
      t.string :country_code
      t.string :country
      t.string :state_code
      t.string :state
      t.string :city
      t.string :map
      t.string :ip

      t.timestamps
    end
  end
end
