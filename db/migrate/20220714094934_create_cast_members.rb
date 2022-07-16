class CreateCastMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :cast_members do |t|
      t.references :book, null: false, foreign_key: true
      t.references :character, null: false, foreign_key: true
      t.text :summary

      t.timestamps
    end
  end
end
