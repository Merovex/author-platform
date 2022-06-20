xml.rss("version" => "2.0", "xmlns:dc" => "http://purl.org/dc/elements/1.1/") do
  xml.channel do
    xml.title(@feed_title)
    xml.link(@url)
    xml.description "Ben Wilson, Author: Recent Updates"
    xml.language "en-us"
    xml.ttl "40"

    @recent_items.each do |item|
      xml.item do
        xml.title(item.title)
        xml.description(post_description(item)) if post_description(item)
        xml.pubDate(item.published_at)
        # xml.guid(@person.firm.account.url + @recent_items.url(item))
        # xml.link(@person.firm.account.url + @recent_items.url(item))
        xml.guid(post_url(item))
        xml.link(post_url(item))

        xml.tag!("dc:creator", item.author_name) if post_has_creator?(item)
      end
    end
  end
end