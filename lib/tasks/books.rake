require 'rmagick'
task set_cover_color: [:environment] do
  Book.all.each do |book|
    next unless book.cover.attached?

    raise "You need to fix updated_at for book cover before running this task, otherwise you'll burn CPU time".inspect
    puts book.cover.inspect
    puts book.cover.created_at.inspect
    puts book.cover.variants.inspect
    next
    Magick::Image.from_blob(book.cover.download).first.write('cover.jpg')
    color = `convert cover.jpg -resize 1x1 txt:-`.match(/#[A-Fa-f0-9]{3,6}/)
    puts "Processing: #{color} for #{book} (was #{book.cover_color})"
    book.update(cover_color: color) if color != book.cover_color
    File.delete('cover.jpg')
  end
end