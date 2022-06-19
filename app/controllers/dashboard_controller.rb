class DashboardController < ApplicationController
  def index
    # @entries = 
    
    @wips = Book.wips
    @wip = @wips.last
    
    @annual_wordcount = WritingEntry.annual_wordcount(Time.now().year)
    @wip_wordcount = 0
    @finish_on = Date.today()
    @target = 75000
    @total_days = 0
    @remaining = "---"

    unless (@wip.nil?)
      @wip_wordcount = @wip.writing_goal.wordcount
      @target = @wip.writing_goal.target || 0
      @total_days = @wip.writing_goal.days_written
      @remaining = @wip.writing_goal.days_remaining
    end
    
    @heatmap_days = {}
    
    WritingEntry.all.each do |entry|
      day = entry.wrote_on.strftime("%Y-%m-%d")
      title = entry.writing_goal.book.title
      @heatmap_days[day] = {words: 0, target: 1000, title: title} if @heatmap_days[day].nil?
      @heatmap_days[day][:words] += entry.count
    end
  end

  def admin
  end
  
  def subscribers
  end
end
