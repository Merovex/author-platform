class AnswersController < ApplicationController
  layout 'insiders'
  before_action :set_question, except: %i[destroy edit]
  before_action :set_answer, only: %i[show edit update destroy]
  before_action :authenticate_user! # , except: %i[show index]
  load_and_authorize_resource

  # GET /answers or /answers.json
  def index
    @answers = Answer.all
  end

  # GET /answers/1 or /answers/1.json
  def show; end

  # GET /answers/new
  def new
    @answer = @question.answers.build
  end

  # GET /answers/1/edit
  def edit
    @question = @answer.question
  end

  # POST /answers or /answers.json
  def create
    @answer = @question.answers.build(answer_params)
    @answer.user = current_user
    respond_to do |format|
      
      if @answer.save
        # @answer.notify :users, key: "comment.reply"
        AnswerNotification.with(answer: @answer).deliver(User.checkin_subscribers)
        # Notify users of the answer
        # notified = User.checkin_subscribers
        # notified.each do |user|
        #   NotificationMailer.checkin_answer_email(user, @answer).deliver
        # end
        format.turbo_stream 
      end
    end
  end

  # PATCH/PUT /answers/1 or /answers/1.json
  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(@answer, partial: 'answers/answer',
                                                             locals: { answer: @answer, parent: @parent })
        end
      end
    end
  end

  # DELETE /answers/1 or /answers/1.json
  def destroy
    @answer.destroy
    respond_to do |format|
      format.turbo_stream
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_answer
    @answer = Answer.find(params[:id])
  end

  def set_question
    @question = Question.find(params[:question_id])
  end

  # Only allow a list of trusted parameters through.
  def answer_params
    params.require(:answer).permit(:content)
  end
end
