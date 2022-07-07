module ProjectsHelper
  def dateness(date, fmt = '%Y-%m-%d')
    return '' if date.blank?

    date.strftime(fmt)
  end

  def target_completion(goal)
    (Date.today + goal.days_remaining).strftime('%-d %b')
  end

  def entries_years(entries)
    entries.map(&:wrote_on).map(&:year).uniq.sort.reverse
  end

  def set_heatmap_data(entries = [])
    days = {}
    entries.each do |entry|
      day = entry.wrote_on.strftime('%Y-%m-%d')
      title = entry.project.book.title
      days[day] = { words: 0, target: 1000, title: } if days[day].nil?
      days[day][:words] += entry.count
    end
    days.to_json.html_safe
  end
end
