class AddCssToLinks < ActiveRecord::Migration[7.0]
  def change
    add_column :links, :css, :string
  end
end
