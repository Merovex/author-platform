class CreateSeries < ActiveRecord::Migration[7.0]
  def change
    create_table :series do |t|
      t.string :title
      t.string :slug
      t.text :synopsis

      t.timestamps
    end
  end
end
