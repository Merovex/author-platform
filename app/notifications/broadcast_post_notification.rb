# To deliver this notification:
#
# BroadcastPostNotification.with(post: @post).deliver_later(current_user)
# BroadcastPostNotification.with(post: @post).deliver(current_user)

class BroadcastPostNotification < Noticed::Base
  # Add your delivery methods
  #
  # deliver_by :database
  deliver_by :email, mailer: "NotificationMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  param :post

  def details
    params[:post]
  end
  def url
    post_path(params[:post])
  end
end
