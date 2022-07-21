require 'color/rgb/contrast'
module BooksHelper
  def image_set_tag(source, srcset = {}, options = {})
    srcset = srcset.map { |src, size| "#{path_to_image(src)} #{size}" }.join(', ')
    image_tag(source, options.merge(srcset: srcset))
  end
  def book_cover_image(book, args = {class: ''})
    # klass = [args[:class].to_s, 'shrink-0 inline-block rounded drop-shadow'].compact.join(' ')

    if book.cover.attached?
      style = [args[:style].to_s, ''].compact.join(' ')
      image_tag(
        book.cover.variant(auto_orient: true, rotate: 0, resize: '400x600^', crop: '400x600+0+0', format: :webp),
        srcset: cover_srcset(book.cover),
        class: [args[:class].to_s, ' rounded drop-shadow'].compact.join(' '),
      )
    else
      klass = [args[:class].to_s, 'bg-gray-800 dark:bg-gray-400 rounded drop-shadow aspect-book dark:text-black text-white font-bold flex justify-center items-center'].compact.join(' ')
      
      tag.div(class: klass) do
        book.title.truncate(20)
      end
      
      # image_tag('annie-spratt-im8y4BO2hso-unsplash.jpg', 
      #   srcset: [
      #     [url_for('annie-spratt-im8y4BO2hso-unsplash-660.webp'), '1028w'],
      #     [url_for('annie-spratt-im8y4BO2hso-unsplash-500.webp'), '1024w'],
      #     [url_for('annie-spratt-im8y4BO2hso-unsplash-330.webp'), '768w'],
      #     [url_for('annie-spratt-im8y4BO2hso-unsplash-200.webp'), '512w']
      #   ],
      #   class: klass)
    end
  end
  def cover_srcset(cover)
    [
      ['660x1000','1280w'],
      ['500x750','1024w'],
      ['330x500','768w'],
      ['200x300','512w'],
    ].map do |variant|
      [
        url_for(cover.variant(auto_orient: true, rotate: 0, resize: "#{variant.first}^", crop: "#{variant.first}+0+0", format: :webp)),
        variant.last
      ]
    end
  end

  def book_cover_background_image(book)
    if book.hero_background.attached?
      rails_blob_url(
        book.hero_background.variant(auto_orient: true, rotate: 0, resize: '1600x900^', crop: '1600x900+0+0') # .processed.url
      )
    elsif book.cover.attached?
      rails_blob_url(book.cover)
    else
      'https://images.unsplash.com/photo-1503830481035-f1180021daf5'
    end
  end

  def hex_to_rgb(hex = '#888888')
    hext = '#888888'
    r = hex[1, 2].to_i(16)
    g = hex[3, 2].to_i(16)
    b = hex[5, 2].to_i(16)
    [r, g, b]
  end

  def brightness(hex)
    Color::RGB.new(*hex_to_rgb(hex)).to_yiq.brightness
  end

  def complementary(hex = '#888888', alpha = 1)
    # comp = Color::RGB.new(*hex_to_rgb(hex)).to_hsl
    # raise hex.inspect
    hex = '#888888' if hex.nil?
    comp = Color::RGB.from_html(hex).to_hsl
    base = Color::RGB.from_html(hex)

    comp.hue -= 180
    # comp.luminosity = 40
    comp.luminosity = 100 - comp.luminosity
    # comp.luminosity = 50

    while base.contrast(comp.to_rgb) < 0.35
      comp.luminosity += if base.to_hsl.luminosity > comp.luminosity
                           -5
                         else
                           5
                         end
    end
    comp.css_rgba(alpha)#.html
  end
  def hex_to_complementary(hex = '#888888', alpha = 1)

  end

  def text_color(book)
    comp = Color::RGB.from_html(book.cover_color).to_hsl
    comp.luminosity = 100 - comp.luminosity
    
    comp.to_yiq.brightness > 0.50 ? 'text-black' : 'text-white dark:text-white'
  end
  def add_praise_link(book)
    link_to "Add Praise", new_book_praise_path(book), class: 'button', data: { turbo_frame: 'modal' }
  end
end
