class AddPositionToTables < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :series_id, :integer
    add_column :books, :position, :integer
    add_column :todos, :position, :integer
    Book.all.each do |book|
      sid = book.episode.series_id
      book.update_column :series_id, sid
    end
    Series.all.each do |serial|
      serial.books.order(:updated_at).each.with_index(1) do |item, index|
        item.update_column :position, index
      end
    end
    Todolist.all.each do |todo_list|
      todo_list.todos.order(:updated_at).each.with_index(1) do |item, index|
        item.update_column :position, index
      end
    end
    add_index :books, :position, name: 'index_on_book_position'
    add_index :todos, :position, name: 'index_on_todo_position'
  end
end
