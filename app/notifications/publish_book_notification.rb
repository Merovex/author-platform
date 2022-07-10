# To deliver this notification:
#
# PublishBookNotification.with(book: @book).deliver_later(current_user)
# PublishBookNotification.with(book: @book).deliver(current_user)

class PublishBookNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database
  deliver_by :email, mailer: "NotificationMailer", method: :published_book_email
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  param :book

  # Define helper methods to make rendering easier.
  #
  def message
    t(".message").html_safe % { details: params[:book].title }
  end
  def details
    params[:book]
  end
  #
  def url
    book_path(params[:book])
  end
end
