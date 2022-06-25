module CommentsHelper
  def create_or_update_time(object)
    edit_text = ""
    time = object.created_at
    unless (object.updated_at.nil?)
      edit_text = "Edited"
      time = object.created_at
    end
    return time, edit_text
  end
end
