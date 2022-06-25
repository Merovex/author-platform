class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :commentable, polymorphic: true
      t.datetime :deleted_at
      t.timestamps
    end
    add_index :comments, [:commentable_id, :commentable_type], :name => "index_on_commentable"
    add_index :comments, [:commentable_id, :commentable_type, :user_id], :name => "index_on_commentable_and_user"
  end
end
