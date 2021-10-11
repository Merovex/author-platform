class CreateEpisodes < ActiveRecord::Migration[7.0]
  def change
    create_table :episodes do |t|
      t.references :book, null: false, foreign_key: true
      t.references :series, null: false, foreign_key: true
      t.integer :order

      t.timestamps
    end
  end
end
