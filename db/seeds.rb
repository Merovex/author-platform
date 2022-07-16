# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'csv'
require 'date'
# WritingEntry.delete_all
# [
#   ['e31clAUB', 'lib/gambit-writing-history.csv'],
#   ['YbVVavjh', 'lib/imbroglio-writing-history.csv']
# ].each do |slug, fname|
#   puts [slug, fname].inspect
#   book = Book.find_using_slug(slug)
#   goal = book.bucket
#   CSV.foreach(Rails.root.join(fname), headers: true) do |row|
#     date = Date.parse(row['Date'])
#     # raise date.inspect
#     entry = book.bucket.writing_entries.create(wrote_on: date, count: row['Words'])
#     entry.save
#     puts entry.inspect
#   end
# end
Book.all.each(&:destroy)
Series.all.each(&:destroy)
Character.all.each(&:destroy)
Link.all.each(&:destroy)
Current.user = User.first

characters = []
15.times do
  characters << Character.create(
    name: Faker::Name.name,
    summary: Faker::Lorem.paragraph(sentence_count: 2, supplemental: true, random_sentences_to_add: 2)
  )
  puts characters.last.inspect
end

3.times do
  series = Series.new(title: Faker::Book.title)
  puts series
  series.save
  (3..6).to_a.sample.times do
    book = series.books.create(
      title: Faker::Book.title,
      synopsis: Faker::Lorem.paragraph(sentence_count: 4, supplemental: true, random_sentences_to_add: 2),
      released_on: Faker::Date.between(from: 2.months.ago, to: 1.month.from_now)
    ) 
    (1..3).to_a.sample.times do
      book.links.create(url: Faker::Internet.url, bookstore_id: Bookstore.all.sample.id)
    end
    puts "..#{book.title} released on #{book.released_on}"
    (0..10).to_a.sample.times do
      book.praises.create(
        comment: Faker::Lorem.paragraph(sentence_count: 2, supplemental: true, random_sentences_to_add: 2),
      )
    end
    book.cast_members.create(character_id: characters.sample.id, summary: Faker::Lorem.sentence)
    book.cast_members.create(character_id: characters.sample.id, summary: Faker::Lorem.sentence)
    book.cast_members.create(character_id: characters.sample.id, summary: Faker::Lorem.sentence)
  end
end