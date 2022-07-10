# To deliver this notification:
#
# SendCheckinReminderNotification.with(post: @post).deliver_later(current_user)
# SendCheckinReminderNotification.with(post: @post).deliver(current_user)

class SendCheckinReminderNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database
  deliver_by :email, mailer: "ReminderMailer", method: :reminder_email
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  param :reminder
  param :remindable
  def url
    polymorphic_path(params[:remindable])
  end
  def details
    params[:remindable]
  end
  def message
    t('.message') % {details: params[:remindable].title}
  end

end
