books.each do |book|
  xml.url do
    xml.loc book_url(book)
  end
end