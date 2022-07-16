module ComponentsHelper
  def aria_label(object)
    case object
    when Post
      date = object.published_at || object.updated_at || object.created_at || Time.now
      return {label: "#{object.class}: #{object.to_s}, published on #{date.strftime('%d %B %Y')}"}
    else
      raise "Unsupported object type: #{object.class}"
    end
  end
end