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
  def underlap(pad=0)
    @underlap_counter = 1001 if @underlap_counter.nil?
    @underlap_counter -= 1
    return "z-[#{@underlap_counter + pad}]"
  end
end
