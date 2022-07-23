class CreateBinders < ActiveRecord::Migration[7.0]
  def change
    create_table :binders do |t|
      t.references :project, null: false, foreign_key: true
      t.string :type

      t.timestamps
    end
  end
end
