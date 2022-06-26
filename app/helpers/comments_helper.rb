module CommentsHelper
  def set_comment_id(comment)
    return (comment.id) ? dom_id(comment) : 'comments-form'
  end
  def create_or_update_time(object)
    edit_text = ""
    time = object.created_at
    unless (object.updated_at.nil?)
      edit_text = "Edited"
      time = object.created_at
    end
    return time, edit_text
  end
  def comment_content_or_new_link(comment)
    return comment.content if comment.id
    return link_to "Add a comment here...", new_polymorphic_path([comment.commentable, comment]), class: "block border h-12 px-4 rounded " 
  end
end
