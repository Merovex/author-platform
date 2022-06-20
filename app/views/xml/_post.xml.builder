posts.each do |post|
  xml.url do
    xml.loc post_url(post)
  end
end