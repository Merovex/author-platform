# To deliver this notification:
#
# AnswerNotification.with(answer: @answer).deliver_later(Current.user)
# AnswerNotification.with(answer: @answer).deliver(Current.user)

class AnswerNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  param :answer

  # Define helper methods to make rendering easier.
  
  def message
    t(".message") % {question: params[:answer].question.title}
  end
  def user
    params[:answer].user
  end
  def details
    params[:answer]
  end

  
  def url
    question_path(params[:answer].question)
  end
end
