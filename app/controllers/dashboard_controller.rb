class DashboardController < ApplicationController
  def index
    @wips = Book.unpublished
    @goal = @wips.last.bucket
    @todolists = Todolist.all
    # @wip = @wips.last
    
    # @annual_wordcount = WritingEntry.annual_wordcount(Time.now().year)
    # @wip_wordcount = 0
    # @finish_on = Date.today()
    # @target = 75000
    # @total_days = 0
    # @remaining = "---"

    # unless (@wip.nil?)
    #   @wip_wordcount = @wip.bucket.wordcount
    #   @target = @wip.bucket.target || 0
    #   @total_days = @wip.bucket.days_written
    #   @remaining = @wip.bucket.days_remaining
    # end
    
  end

  def admin
  end
  
  def subscribers
  end
end
