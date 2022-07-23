class NotificationsController < ApplicationController
  layout 'dashboard'
  after_action :mark_read
  def index
    # @pagy, @records = pagy(Product.some_scope)
    @unread_notifications = Current.user.notifications.unread.reverse
    @pagy, @read_notifications = pagy(Current.user.notifications.read)
  end

  def mark_read
    return if @unread_notifications.empty?
    @unread_notifications.each { |n| n.update(read_at: Time.now) }
    
  end
  private
  def set_notification
    @notification = Notification.find(params[:id])
  end
end
