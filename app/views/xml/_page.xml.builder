@pages.each do |page|
  xml.url do
    xml.loc slug_url(page)
    xml << "<lastmod>#{page.updated_at}</lastmod>\n"
  end
end