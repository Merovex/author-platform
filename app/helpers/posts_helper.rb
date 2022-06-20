module PostsHelper
  def post_description(post)
    return "" if post.content.blank?
    return truncate(post.content.to_plain_text, length: 80)
  end
  def post_has_creator?(post)
    return (!post.user.nil?)
  end
end
