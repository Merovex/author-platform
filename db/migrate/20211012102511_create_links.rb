class CreateLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :links do |t|
      t.string :slug
      t.string :url
      t.integer :clicked, default: 0
      t.text :comment

      t.timestamps
    end
  end
end
