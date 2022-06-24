class AddDueOnToTodos < ActiveRecord::Migration[7.0]
  def change
    add_column :todos, :due_on, :date
  end
end
