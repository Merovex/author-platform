class CreatePraises < ActiveRecord::Migration[7.0]
  def change
    create_table :praises do |t|
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
