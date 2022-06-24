class AddDoneAtToTodos < ActiveRecord::Migration[7.0]
  def change
    add_column :todos, :done_at, :datetime
  end
end
