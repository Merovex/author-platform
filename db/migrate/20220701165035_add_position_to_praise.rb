class AddPositionToPraise < ActiveRecord::Migration[7.0]
  def change
    add_column :praises, :position, :integer
    Book.all.each do |book|
      book.praises.each_with_index do |praise, index|
        praise.update_column(:position, index)
      end
    end
  end
end
