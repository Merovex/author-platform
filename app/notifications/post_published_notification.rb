# To deliver this notification:
#
# PostPublishedNotification.with(post: @post).deliver_later(current_user)
# PostPublishedNotification.with(post: @post).deliver(current_user)

class PostPublishedNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  param :post

  # Define helper methods to make rendering easier.
  #
  def message
    t(".message") % {post: params[:post].title}
  end
  #
  def details
    params[:post]
  end
  def user
    params[:post].user
  end
  def url
    post_path(params[:post])
  end
end
