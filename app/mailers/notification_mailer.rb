class NotificationMailer < ApplicationMailer
  def post_broadcast_email(user, request)
    @post = request
    @user = user
    mail to: user.email, subject: @post.title
  end
  def checkin_answer_email(user, request)
    @post = request
    @user = user
    mail to: user.email, subject: @post.question.title
  end
end
