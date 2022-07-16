class CreateBookstores < ActiveRecord::Migration[7.0]
  def change
    create_table :bookstores do |t|
      t.string :key
      t.string :name

      t.timestamps
    end
    [
      ['apple', 'Apple Books'],
      ['amazon', 'Amazon'],
      ['audible', 'Audible'],
      ['barnes', 'Barnes & Noble'],
      ['google', 'Google Books'],
      ['kindle', 'Kindle'],
      ['kobo', 'Kobo'],
      ['nook', 'Nook'],
      ['smashwords', 'Smashwords'],
    ].each do |bookstore|
      Bookstore.create(key: bookstore[0], name: bookstore[1])
    end
  end
end
