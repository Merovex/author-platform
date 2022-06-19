class WritingGoalsController < ApplicationController
  # before_action :set_book, only: %i[ show new edit ]
  before_action :set_writing_goal#, only: %i[ create update destroy ]

  # GET /writing_goals or /writing_goals.json
  def index
    @writing_goals = WritingGoal.all
  end

  # GET /writing_goals/1 or /writing_goals/1.json
  def show
    @total = 0
    @percentage = 0
    @target = (@writing_goal.target.nil? or @writing_goal.target > 0) ? @writing_goal.target : 1
    @entries = {}
    @writing_goal.writing_entries.each do |entry|
      @entries[entry.wrote_on] = entry
    end
    # @heatmap_days = build_heatmap(@writing_goal.writing_entries)
  end

  # GET /writing_goals/new
  def new
    @writing_goal = @book.build_writing_goal
  end

  # GET /writing_goals/1/edit
  def edit
  end

  # POST /writing_goals or /writing_goals.json
  def create
    raise "HERE?".inspect
    # @writing_goal = WritingGoal.new(writing_goal_params)

    # respond_to do |format|
    #   if @writing_goal.save
    #     format.html { redirect_to writing_goal_url(@writing_goal), notice: "Writing goal for #{@writing_goal.book.title} was successfully created." }
    #     format.json { render :show, status: :created, location: @writing_goal }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @writing_goal.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /writing_goals/1 or /writing_goals/1.json
  def update
    # raise @writing_goal.book.inspect
    respond_to do |format|
      if @writing_goal.update(writing_goal_params)
        format.html { redirect_to writing_goal_url(@writing_goal), notice: "Writing goal for <em>#{@writing_goal.book.title}</em> was successfully updated." }
        format.json { render :show, status: :ok, location: @writing_goal }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @writing_goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /writing_goals/1 or /writing_goals/1.json
  def destroy
    @writing_goal.destroy

    respond_to do |format|
      format.html { redirect_to writing_goals_url, notice: "Writing goal was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_writing_goal
      @writing_goal = WritingGoal.find_using_slug(params[:id])
      @book = @writing_goal.book
    end

    # Only allow a list of trusted parameters through.
    def writing_goal_params
      params.require(:writing_goal).permit(:book_id, :start_on, :finish_on, :target, :summary)
    end
end
