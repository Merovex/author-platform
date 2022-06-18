class DashboardController < ApplicationController
  def index
    @entries = WritingEntry.all#.group_by(&:wrote_on)
    @heatmap_days = {}
    @entries.each do |entry|
      day = entry.wrote_on.strftime("%Y-%m-%d")
      @heatmap_days[day] = {words: 0, target: 1000} if @heatmap_days[day].nil?
      @heatmap_days[day][:words] += entry.count
    end
  end

  def pages
  end

  def posts
  end

  def subscribers
  end
end
