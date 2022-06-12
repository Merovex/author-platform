class SubscriptionMailer < ApplicationMailer
  def post_email(user, request)
    @post = request
    @user = user
    mail to: user.email, subject: request.title
  end
end
