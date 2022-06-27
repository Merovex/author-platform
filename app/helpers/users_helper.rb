module UsersHelper
  def user_avatar_image(user, size = 60)
    image = user_avatar(user, size)
    image_tag(image, class: 'rounded-full mx-auto')
  end

  def user_avatar(user, size = 60)
    image = if user.avatar.attached?
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
