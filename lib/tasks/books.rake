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
task compress_images: [:environment] do
  Dir.glob(Dir.home + '/Downloads/*.jpg').each do |file|
    puts "Processing: #{file}"
    webp = file.gsub(/\.jpg$/, '.webp')
    image = Magick::Image.read(file).first.gaussian_blur(0.05).write(webp)
    percent = 100 - (File.size(webp).to_f / File.size(file).to_f * 100.0)
    puts ".. compressed from #{File.size(file)} to #{File.size(webp)} (#{percent.round(0)}% reduction)"
    # cmd = "magick #{file} -strip -interlace Plane -gaussian-blur 0.05 -quality 85% #{webp}"
    # puts cmd
  end
  # magick Gambit\ art.jpg -strip -interlace Plane -gaussian-blur 0.05 -quality 85% Gambit\ art.webp
end