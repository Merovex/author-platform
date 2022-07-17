module NotificationsHelper
  def notifications_badge()
    count = current_user.notifications.unread.count
    return if count.zero?
    count = "99+" if count > 99
    return tag.span(count, class: "absolute inline-block top-0 right-0 bottom-auto left-auto translate-x-2/4 -translate-y-1/2 rotate-0 skew-x-0 skew-y-0 scale-x-100 scale-y-100 px-1 text-xs bg-gradient-to-t text-white from-danger to-danger-light rounded-full z-10")    
  end
end