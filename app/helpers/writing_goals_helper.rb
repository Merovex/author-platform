module WritingGoalsHelper
  def dateness(date, fmt="%Y-%m-%d")
    return "" if date.blank?
    return date.strftime(fmt)
  end

end
