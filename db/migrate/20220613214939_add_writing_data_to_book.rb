class AddWritingDataToBook < ActiveRecord::Migration[7.0]
  def change
    add_index :books, :released_on
    add_index :books, :is_featured
  end
end
