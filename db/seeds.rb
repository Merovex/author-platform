# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'csv'
require 'date'
WritingEntry.delete_all
[
  ['e31clAUB', 'lib/gambit-writing-history.csv'],
  ['YbVVavjh', 'lib/imbroglio-writing-history.csv']
].each do |slug, fname|
  puts [slug, fname].inspect
  book = Book.find_using_slug(slug)
  goal = book.bucket
  CSV.foreach(Rails.root.join(fname), headers: true) do |row|
    date = Date.parse(row['Date'])
    # raise date.inspect
    entry = book.bucket.writing_entries.create(wrote_on: date, count: row['Words'])
    entry.save
    puts entry.inspect
  end
end
