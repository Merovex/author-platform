class UserMailerPreview < ActionMailer::Preview
  def validate_email
    UserMailer.with(user: User.first).welcome_email
  end
end
