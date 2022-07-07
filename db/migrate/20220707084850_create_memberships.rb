class CreateMemberships < ActiveRecord::Migration[7.0]
  def change
    create_table :memberships do |t|
      t.references :user, null: false, foreign_key: true
      t.references :membershipable, polymorphic: true, null: false
      t.boolean :involved, default: false # Whether they are actively involved (Pig) or engaged (Chicken)
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
