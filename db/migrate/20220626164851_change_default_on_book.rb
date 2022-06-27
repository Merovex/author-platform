class ChangeDefaultOnBook < ActiveRecord::Migration[7.0]
  def change
    change_column_default :books, :is_featured, false
    change_column_default :books, :cover_color, '#808080'
    remove_column :books, :is_wip
    Book.all.each do |book|
      book.update_column(:cover_color, '#808080') if book.cover_color.nil?
      book.update_column(:is_featured, false)
    end
  end
end
