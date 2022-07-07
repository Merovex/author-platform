class DashboardController < ApplicationController
  def index
    @wips = Book.unpublished
    @goal = @wips.last.project
    @todolists = Todolist.all
    @teams = Team.all
  end

  def admin; end

  def subscribers; end
end
