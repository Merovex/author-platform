class AddBroadcastingToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :broadcasted_at, :datetime
  end
end
