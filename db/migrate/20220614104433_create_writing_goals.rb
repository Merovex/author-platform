class CreateWritingGoals < ActiveRecord::Migration[7.0]
  def change
    create_table :buckets do |t|
      t.references :book, null: false, foreign_key: true
      t.date :start_on
      t.date :finish_on
      t.integer :target
      t.text :summary

      t.timestamps
    end
  end
end
