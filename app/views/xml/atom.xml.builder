atom_feed do |feed|
  feed.title('Ben Wilson, Author')
  feed.updated(@posts.first.updated_at) if @posts.count > 0

  @posts.each do |post|
    feed.entry(post) do |entry|
      next if post.content.to_plain_text.empty? || post.title.blank?

      entry.title(post.title)
      entry.content(post.content.to_plain_text, type: 'text')

      entry.author do |author|
        author.name(post.author_name)
      end
    end
  end
end
