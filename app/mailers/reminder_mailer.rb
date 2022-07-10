class ReminderMailer < ApplicationMailer
  def reminder_email
    @reminder = params[:reminder]
    @remindable = @reminder.remindable
    @user = params[:recipient]
    @subject = @remindable.title
    @url = polymorphic_url(@remindable)
    @unsub_url = unsubscribe_url(@user.unsubscribe_hash, subscription: "new_checkins_sent")

    mail to: @user.email, subject: @subject
  end
end

# What progress have you made over the past week?

# Please take a minute to answer this question. You can either reply to this email or click the button below to answer in Basecamp.

# Write up an answer
# Unsubscribe • Change your notification settings

# Get easier, faster access to Basecamp when it's on your phone. Grab an app!
