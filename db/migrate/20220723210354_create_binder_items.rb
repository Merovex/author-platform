class CreateBinderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :binder_items do |t|
      t.string :name
      t.string :ancestry
      t.text :synopsis
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
    add_index :binder_items, :ancestry
  end
end
