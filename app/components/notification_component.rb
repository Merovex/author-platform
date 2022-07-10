# frozen_string_literal: true

class NotificationComponent < ViewComponent::Base
  include LocalTimeHelper
  include UsersHelper
  def initialize(notification:)
    @notification = notification
    @details = notification.to_notification.details
    @url = @notification.to_notification.url

    @user = @details.user
  end
end
