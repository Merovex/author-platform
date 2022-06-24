class CreateTodos < ActiveRecord::Migration[7.0]
  def change
    create_table :todos do |t|
      t.integer :created_by_id, null: false, foreign_key: true
      t.integer :assigned_to_id, null: true, foreign_key: true
      t.references :todolist, null: false, foreign_key: true
      t.text :summary

      t.timestamps
    end
  end
end
