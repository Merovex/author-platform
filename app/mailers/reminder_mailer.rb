class ReminderMailer < ApplicationMailer
  def reminder_email(user, remindable)
    @title = remindable.title
    @user = user
    @url = polymorphic_url(remindable)
    puts "URL: #{@url}"
    mail to: user.email, subject: remindable.title
  end
end

# What progress have you made over the past week?

# Please take a minute to answer this question. You can either reply to this email or click the button below to answer in Basecamp.

# Write up an answer
# Unsubscribe • Change your notification settings

# Get easier, faster access to Basecamp when it's on your phone. Grab an app!

	