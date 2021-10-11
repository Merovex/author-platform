class RemoveSynopsisFromBook < ActiveRecord::Migration[7.0]
  def change
    remove_column :books, :synopsis, :text
  end
end
