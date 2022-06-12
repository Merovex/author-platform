class AddTaglineToBook < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :tagline, :text
  end
end
