class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.text :description
      t.datetime :deleted_at

      t.timestamps
    end
  end
end