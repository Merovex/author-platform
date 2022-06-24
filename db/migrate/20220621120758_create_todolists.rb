class CreateTodolists < ActiveRecord::Migration[7.0]
  def change
    create_table :todolists do |t|
      t.string :name
      t.integer :todolistable_id
      t.string :todolistable_type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
