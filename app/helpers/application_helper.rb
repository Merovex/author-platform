module ApplicationHelper
  def nav_link_to(text, path, _options = {})
    klass = 'inline-block w-1/3 py-1 text-center uppercase align-middle md:w-1/6 text-brand-800 dark:text-brand-200 border-b-4 border-white dark:border-gray-800 hover:border-brand-500'
    link_to(text, path, class: klass)
  end

  def slug_url(obj)
    return '' unless obj.respond_to?(:slug)

    [polymorphic_url(obj.class), obj.slug].join('/').downcase
  end

  def bi_icon(name, args = {})
    klass = ['bi-icon', "bi-#{name}", strip_tags(args[:class])].join(' ')
    raw("<i class='#{klass}'></i>")
  end

  def inverse_button_css(color = 'blue')
    border_color = {
      brand: 'border-brand',
      error: 'border-error',
      audible: 'border-[#961110]',
      amazon: 'border-[#ff9900]',
      kindle: 'border-[#198ae2]',
      nobles: 'border-[#3e5962]'
    }[color.to_sym]
    "bg-gray-50 #{border_color} text-black button"
  end

  def button_css(color = 'blue')
    bg_color = {
      brand: 'bg-brand',
      error: 'bg-error',
      audible: 'bg-[#961110]',
      amazon: 'bg-[#ff9900]',
      kindle: 'bg-[#198ae2]',
      nobles: 'bg-[#3e5962]'
    }[color.to_sym]
    "#{bg_color} border-gray-500/50 text-white button"
  end

  def edit_link_to(object, text = '', _args = {})
    obj = (object.is_a? Array) ? object.last : object
    [text, obj.class].join(' ').strip
    link_to(
      [bi_icon('pencil'), strip_tags(text)].join(' ').html_safe, edit_polymorphic_path(object),
      data: { turbo_frame: dom_id(obj) }
    )
  end

  def trash_link_to(object, text = '')
    link_to(
      [bi_icon('trash'), strip_tags(text)].join(' ').html_safe, polymorphic_path(object),
      data: { turbo_method: :delete, turbo_confirm: 'Are you sure?' }
    )
  end

  def zebra
    cycle('bg-gray-600 text-white', '', name: 'zebra')
  end

  def headline(title, args = { wrap_title: true })
    content_for(:title, title)
    args[:class] = args[:class].nil? ? 'headline' : args[:class]
    content = tag.h1(title, class: args[:class])
    return content unless args[:wrap_title]

    tag.section(content, class: 'section')
  end
  def title(object, title)
    (object.nil?) ? h2(title) : headline(title)
  end

  def panel_headline(title)
    tag.h1(title, class: 'panel-headline')
  end

  def h2(text, args = {})
    args = [class: args] if args.is_a?(String)
    args[:class] = args[:class].nil? ? 'subtitle' : "#{args[:class]} subtitle"
    text = t(text) if text.is_a?(Symbol)
    tag.h2(text, class: args[:class])
  end

  def h3(text, args = {})
    args = [class: args] if args.is_a?(String)
    text = t(text) if text.is_a?(Symbol)
    tag.h3(text, class: args[:class])
  end

  def barchart(data, type = 'undefined')
    id = SecureRandom.uuid.split('-').first
    # https://github.com/ankane/chartkick
    answer = <<EOF
    <canvas id="chart-#{id}" class='w-1/2 mx-auto overflow-x-scroll max-h-48'></canvas>
    <script>
      var ctx = document.getElementById('chart-#{id}').getContext('2d');
      var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: #{data.keys.inspect},
            datasets: [{ label: '# of #{type}', data: #{data.values.inspect}, }]
        },
        options: {
            scales: { y: { beginAtZero: true } }
        }
      });
    </script>
EOF
    answer.html_safe
  end
end
