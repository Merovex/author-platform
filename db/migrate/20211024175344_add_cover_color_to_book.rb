class AddCoverColorToBook < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :cover_color, :string
  end
end
