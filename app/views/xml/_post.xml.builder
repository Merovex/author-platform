posts.each do |post|
  xml.url do
    xml.loc slug_url(post)
    xml << "<lastmod>#{post.updated_at}</lastmod>\n"
  end
end