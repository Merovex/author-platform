  task set_cover_color: [:environment] do
    Book.all.each do |book|
      Rails.application.routes.url_helpers.rails_blob_path(user.avatar, only_path: true)
    raise rails_blob_url(book.cover).inspect
    color = `convert #{rails_blob_path(cover)} -resize 1x1 txt:-`.match(/#[A-Fa-f0-9]{3,6}/)
    raise color.inspect
    end
  end