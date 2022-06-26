class DashboardController < ApplicationController
  def index
    @wips = Book.unpublished
    @goal = @wips.last.writing_goal
    @todolists = Todolist.all
    # @wip = @wips.last
    
    # @annual_wordcount = WritingEntry.annual_wordcount(Time.now().year)
    # @wip_wordcount = 0
    # @finish_on = Date.today()
    # @target = 75000
    # @total_days = 0
    # @remaining = "---"

    # unless (@wip.nil?)
    #   @wip_wordcount = @wip.writing_goal.wordcount
    #   @target = @wip.writing_goal.target || 0
    #   @total_days = @wip.writing_goal.days_written
    #   @remaining = @wip.writing_goal.days_remaining
    # end
    
  end

  def admin
  end
  
  def subscribers
  end
end
