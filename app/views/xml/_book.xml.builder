books.each do |book|
  xml.url do
    xml.loc slug_url(book)
    xml << "<lastmod>#{book.updated_at}</lastmod>\n"
  end
end
