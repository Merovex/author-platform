class DashboardController < ApplicationController
  def index
    @entries = WritingEntry.all
    @wip = Book.wip.last
    
    jan_1 = Date.new(Time.now().year,1,1)
    dec_31 = Date.new(Time.now().year,12,31)
    
    @annual_wordcount = WritingEntry.where(wrote_on: jan_1 .. dec_31).map(&:count).inject(0, :+)
    @wip_wordcount = @wip.writing_goal.writing_entries.map(&:count).inject(0, :+)
    @heatmap_days = {}
    @finish_on = @wip.writing_goal.finish_on
    @target = @wip.writing_goal.target
    @remaining = (Date.today + ((@target - @wip_wordcount) / 1000).to_i).strftime("%-d %b")
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
