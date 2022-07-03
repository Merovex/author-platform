class QuestionsController < ApplicationController
  add_breadcrumb "Dashboard", :dashboard_path
  before_action :set_question, only: %i[show edit update destroy]

  # GET /questions or /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1 or /questions/1.json
  def show; end

  # GET /questions/new
  def new
    @question = Question.new
    @reminder = @question.build_reminder()
  end

  # GET /questions/1/edit
  def edit
    @reminder = @question.reminder || @question.build_reminder() 
  end

  # POST /questions or /questions.json
  def create
    @question = Question.new(title: question_params[:title])
    @reminder = @question.build_reminder()
    @reminder.recurring = question_params[:reminder]
    respond_to do |format|
      if @question.save
        @reminder.save!
        format.html { redirect_to question_url(@question), notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1 or /questions/1.json
  def update
    @reminder = @question.build_reminder()
    @reminder.recurring = question_params[:reminder]

    respond_to do |format|
      if @question.update(title: question_params[:title])
        @reminder.save!
        puts "HERE" + @reminder.inspect
        format.html { redirect_to question_url(@question), notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1 or /questions/1.json
  def destroy
    @question.destroy

    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_question
    @question = Question.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def question_params
    params.require(:question).permit(:title, reminder: [:rule_type, :tod, :todc, :custom, :weekly_dow, :fortnightly_dow, :monthly_dow, daily_dow: []])
  end
end
