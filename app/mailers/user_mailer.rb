class UserMailer < ActionMailer::Base
  def validate_email(user, request)
    @user = user
    # @url  = user_url(@user, host: request.host_with_port)
    @url = request
    # raise @url.inspect
    mail to: @user.email, subject: 'Sign in into mywebsite.com'
  end
end
