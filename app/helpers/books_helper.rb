module BooksHelper
  def hero_background(book)
    return rails_blob_url(book.hero_background) if book.hero_background.attached?
    return rails_blob_url(book.cover) if book.cover.attached?
    
    "https://images.unsplash.com/photo-1503830481035-f1180021daf5"
  end
end
