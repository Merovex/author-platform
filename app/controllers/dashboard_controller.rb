class DashboardController < ApplicationController
  def index
    @wips = Book.unpublished
    @goal = @wips.last.bucket
    @todolists = Todolist.all
  end

  def admin; end

  def subscribers; end
end
