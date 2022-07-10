class DashboardController < ApplicationController
  layout 'insiders'
  before_action :authenticate_user! # , except: %i[show index]
  load_and_authorize_resource
  def index
    @wips = Book.unpublished
    @goal = @wips.last.project
    @todolists = Todolist.all
    @teams = Team.all
  end

  def admin; end

  def subscribers; end
end
