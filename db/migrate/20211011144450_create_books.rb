class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :slug
      t.boolean :is_featured
      t.date :released_on
      t.text :synopsis

      t.timestamps
    end
  end
end
