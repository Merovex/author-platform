class UserMailer < ActionMailer::Base
  def validate_email(user, request)
    @user = user
    @url = request
    mail to: @user.email, subject: 'Sign in into mywebsite.com'
  end
end
