module ApplicationHelper
  def button_css(color = 'blue')
    "bg-#{color}-500 text-white px-4 py-2 rounded font-medium mx-2 hover:bg-#{color}-600 transition duration-200 each-in-out text-base inline-block"
  end
  def zebra()
    cycle('bg-gray-100 dark:bg-gray-700','', name: 'zebra')
  end
  def headline(title, wrap_title = true)
    content_for(:title, title)
    css_class = %w[
      font-display title text-3xl md:text-5xl text-black dark:text-white mt-4 mb-8
    ].join(' ')
    content = tag.h1(title, class: css_class)

    return content unless wrap_title

    tag.section(content, class: 'section')
  end
  def panel_headline(title)
    css_class = %w[
      font-sans title text-2xl md:text-3xl text-black dark:text-white font-bold mt-4 mb-8 text-center
    ].join(' ')
    content = tag.h1(title, class: css_class)
  end
  def h2(text, klass='')
    text = t(text) if text.is_a?(Symbol)
    css_class = %w[
      font-display title text-2xl md:text-3xl text-black dark:text-white
    ].join(' ')
    content = tag.h2(text, class: "#{css_class} #{klass}")
  end
  def barchart(data, type = 'undefined')
    id = SecureRandom.uuid.split('-').first
    # https://github.com/ankane/chartkick
    answer = <<EOF
    <canvas id="chart-#{id}" class='max-h-48 w-1/2 mx-auto overflow-x-scroll'></canvas>
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
  return answer.html_safe
  end
end
