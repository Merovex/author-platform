@pages.each do |page|
  xml.url do
    xml.loc page_url(page)
  end
end