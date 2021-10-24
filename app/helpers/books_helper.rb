module BooksHelper
  def hero_background(book)
    # return rails_blob_url(book.cover)
    return rails_blob_url(book.cover) if book.hero_background.attached?
    return rails_blob_url(book.cover) if book.cover.attached?
    
    "https://images.unsplash.com/photo-1503830481035-f1180021daf5"
  end
  def bgcolor(hex)
    r = hex[1,2].to_i(16) || 128
    g = hex[3,2].to_i(16) || 128
    b = hex[5,2].to_i(16) || 128
    yiq = ((r*299)+(g*587)+(b*114))/1000
    bgcolor = (yiq > 128) ? "bg-black" : "bg-white"
    txtcolor = (yiq > 128) ? "text-white" : "text-black"
    [bgcolor,txtcolor]
    # [hex, r, g, b, yiq, c]
  end
end
