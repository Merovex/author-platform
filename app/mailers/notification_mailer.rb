class NotificationMailer < ApplicationMailer
  def published_book_email
    @book = params[:book]
    @user = params[:recipient]
    @url = book_url(@book)
    @unsub_url = unsubscribe_url(@user.unsubscribe_hash, subscription: "new_posts_sent")
    mail to: @user.email, subject: @book.title
  end
  def broadcast_post_notification
    @post = params[:post]
    @user = params[:recipient]
    @url = post_url(@post)
    @unsub_url = unsubscribe_url(@user.unsubscribe_hash, subscription: "new_posts_sent")
    mail to: @user.email, subject: @post.title
  end
  def checkin_answer_email
    # @post = request
    # @user = user
    # mail to: user.email, subject: @post.question.title
    @answer = params[:answer]
    @user = params[:recipient]
    @url = question_url(@answer.question)
    @unsub_url = unsubscribe_url(@user.unsubscribe_hash, subscription: "new_checkins_sent")
    mail to: @user.email, subject: "New Checkin: #{@answer.question.title}"
  end
end
