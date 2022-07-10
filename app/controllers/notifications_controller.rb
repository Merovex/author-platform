class NotificationsController < ApplicationController
  layout 'insiders'
  after_action :mark_read
  def index
    @unread_notifications = Current.user.notifications.unread.reverse
    @read_notifications = Current.user.notifications.read.reverse
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
