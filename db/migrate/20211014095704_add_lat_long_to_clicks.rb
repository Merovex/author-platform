class AddLatLongToClicks < ActiveRecord::Migration[7.0]
  def change
    add_column :clicks, :latitude, :float
    add_column :clicks, :longitude, :float
  end
end
