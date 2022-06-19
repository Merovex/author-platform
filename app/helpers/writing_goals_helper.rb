module WritingGoalsHelper
  def dateness(date, fmt="%Y-%m-%d")
    return "" if date.blank?
    return date.strftime(fmt)
  end
  def target_completion(goal)
    (Date.today + goal.days_remaining).strftime("%-d %b")
  end
  def entries_years(entries)
    return entries.map(&:wrote_on).map(&:year).uniq.sort.reverse
  end
  def set_heatmap_data(entries=[])
    days = {}
    entries.each do |entry|
      day = entry.wrote_on.strftime("%Y-%m-%d")
      title = entry.writing_goal.book.title
      days[day] = {words: 0, target: 1000, title: title} if days[day].nil?
      days[day][:words] += entry.count
    end
    return days.to_json.html_safe 
  end
end
