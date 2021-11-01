module ApplicationHelper
  def button_css(color = 'blue')
    "bg-#{color}-500 border-#{color}-600 text-white button"
  end
  def zebra()
    cycle('bg-gray-100 dark:bg-gray-700','', name: 'zebra')
  end
  def headline(title, wrap_title = true)
    content_for(:title, title)
    content = tag.h1(title, class: 'headline')

    return content unless wrap_title

    tag.section(content, class: 'section')
  end
  def panel_headline(title)
    content = tag.h1(title, class: 'panel_headline')
  end
  def h2(text, klass='')
    text = t(text) if text.is_a?(Symbol)
    content = tag.h2(text, class: "subtitle #{klass}")
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
  return answer.html_safe
  end
  def format_time(time, timezone)
    time = time.to_time
    content_tag(:span, I18n.l(time, format: :long), data: { timezone: timezone, time: time.iso8601 })
  end
  def local_time(time, format="MM/dd/yyyy")
    return if time.nil?

    time_tag(time, data: { controller: 'localtime', format: format})
  end
  def local_time_popover(time)
    return if time.nil?
    
    summary = time_tag(time, data: { controller: 'localtime', format: 'relative'})
    details = time_tag(time, data: { controller: 'localtime', format: "dd MMMM YYYY"})
    content_tag(:details,  content_tag(:summary, summary) + content_tag(:span, details) )
  end
end
