class AddBookstoreToLink < ActiveRecord::Migration[7.0]
  def change
    add_column :links, :bookstore_id, :integer
    Link.all.each do |link|
      link.update(bookstore_id: 2) if link.linkable_type == 'Book' # Setting to Amazon by default
    end
  end
end
