class QuestionsController < ApplicationController
  layout 'insiders'
  add_breadcrumb 'Dashboard', :dashboard_path
  add_breadcrumb 'Check-ins', :questions_path, only: %i[index show new edit]
  before_action :set_question, only: %i[show edit update destroy]
  before_action :authenticate_user! # , except: %i[show index]
  load_and_authorize_resource

  # GET /questions or /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1 or /questions/1.json
  def show; end

  # GET /questions/new
  def new
    @question = Question.new
    @reminder = @question.build_reminder
  end

  # GET /questions/1/edit
  def edit
    @reminder = @question.reminder || @question.build_reminder
  end

  # POST /questions or /questions.json
  def create
    @question = Question.new(title: question_params[:title])
    @reminder = @question.build_reminder
    respond_to do |format|
      if @question.save
        @reminder.update(reminder_params)
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
    @reminder = @question.reminder || @question.build_reminder

    respond_to do |format|
      if @question.update(title: question_params[:title])
        @reminder.update(reminder_params)
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
    begin
      @question = Question.find(params[:id])
    rescue
      redirect_to questions_path, notice: 'Question not found.'
    end
  end
  def reminder_params
    r = {
      frequency: 'daily',
      start_time: Time.now,
      days: [1, 2, 3, 4, 5]
    }
    # Set Frequency
    r[:frequency] = question_params[:reminder][:frequency] unless question_params[:reminder][:frequency].nil?
    # Set Days
    r[:days] = if r[:frequency] == 'daily'
      question_params[:reminder][:daily].reject { |c| c.empty? }
    elsif r[:frequency] == 'weekly'
      question_params[:reminder][:weekly].split
    elsif r[:frequency] == 'fortnightly'
      question_params[:reminder][:fortnightly].split
    elsif r[:frequency] == 'monthly'
      question_params[:reminder][:monthly].split
    end
    # Set Start Time
    time = question_params[:reminder][:tod] == 'custom' ? question_params[:reminder][:custom] : question_params[:reminder][:tod]
    r[:start_time] = Time.now.change(hour: time.split(':')[0].to_i, min: time.split(':')[1].to_i)

    return r
  end

  # Only allow a list of trusted parameters through.
  def question_params
    params.require(:question).permit(
      :title,
      reminder: [:frequency, :tod, :custom, :weekly, :fortnightly, :monthly, { daily: [] }]
    )
  end
end
