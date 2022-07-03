class SubscriptionMailer < ApplicationMailer
  def post_email(user, request)
    @post = request
    @user = User.find_by(email: 'ben@merovex.com')
    mail to: user.email, subject: request.title
    
  end
end
