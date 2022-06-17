require 'color/rgb/contrast'
module BooksHelper
  def hero_background(book)
    # return rails_blob_url(book.cover)
    return rails_blob_url(book.background) if book.hero_background.attached?
    return rails_blob_url(book.cover) if book.cover.attached?
    
    "https://images.unsplash.com/photo-1503830481035-f1180021daf5"
  end
  def hex_to_rgb(hex="#888888")
    r = hex[1,2].to_i(16)
    g = hex[3,2].to_i(16)
    b = hex[5,2].to_i(16)
    [r,g,b]
  end
  def brightness(hex)
    brightness = Color::RGB.new(*hex_to_rgb(hex)).to_yiq.brightness
  end
  def complementary(hex="#888888")
    # comp = Color::RGB.new(*hex_to_rgb(hex)).to_hsl
    # raise hex.inspect
    hex = "#888888" if hex.nil?
    comp = Color::RGB.from_html(hex).to_hsl
    base = Color::RGB.from_html(hex)

    comp.hue -=180
    comp.luminosity = 100 - comp.luminosity

    while base.contrast(comp.to_rgb) < 0.25
      comp.luminosity += if base.to_hsl.luminosity > comp.luminosity
        -5
      else
        5
      end
    end
    # raise [base.html, comp.to_rgb.html, base.contrast(comp.to_rgb)].inspect
    comp.to_rgb.html
  end
  def text_color(hex)
    hex = complementary(hex)
    brightness = brightness(hex)
    (brightness > 0.50) ? "text-black dark:text-white" : "text-white dark:text-white"
  end
end
