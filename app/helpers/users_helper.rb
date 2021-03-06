module UsersHelper
  def user_avatar_image(user, size = 60, klass = 'mx-auto')
    # <img srcset="" width="40" height="40">
    
    image = user_avatar(user, size)
    image_tag(image, class: "rounded-full border border-white dark-border-black #{klass}")
  end
  
  def user_avatar(user, size = 60)
    return Identicon.data_url_for("Speak, Lord, for your servant obeys.", size) if user.nil?

    if user.avatar.attached?
      user.avatar.variant(resize: "#{size}x#{size}!")
    else
      Identicon.data_url_for(user.to_s, size)
    end
    # initials = '<span class="table-cell font-bold text-white align-middle border">KR</span>'
    # tag.div(image, class: "h-10 w-10 table relative rounded-full bg-brand text-white text-center font-semibold flex item-center")
  end

  def user_masquerade?
    false
  end
end
