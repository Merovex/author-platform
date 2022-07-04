class DayOfWeek
  attr_reader :id
  attr_reader :name
  def initialize(day)
    @id = day
    @name = day.capitalize[0..2]
  end
end

module RemindersHelper
  DOW = %i[sunday monday tuesday wednesday thursday friday saturday]
  STATIC_TIMES = %w[9:00 16:30]
  def static_time(i) = STATIC_TIMES.[](i)

  def label_class
    'peer-checked:bg-brand-500 inline-flex rounded px-4 text-center'
  end

  def to_12hr(time)
    time = Time.parse(time) if time.is_a? String
    time.strftime('%-I:%M%P')
  end

  def box_button(text)
    tag.span(text, class: label_class)
  end

  def reminder_label(form, frequency, text, checked)
    tag.summary do
      tag.label(class: 'h-8 block') do
        form.radio_button(:frequency, frequency, class: 'mr-4', checked: checked) + "#{text} &#8230;".html_safe
      end
    end
  end

  def checked_if_day?(reminder, id)
    puts [ reminder.days, id ].inspect
    reminder.days.include?(id.to_s)
  end

  def checked_if_time?(reminder, time)
    return STATIC_TIMES.include?(reminder.start_time.strftime('%-H:%M')) if time.is_a? Array
    return (time == reminder.start_time.strftime('%-H:%M')) unless reminder.start_time.nil?

    false
  end

  def dynamic_time?(reminder)
    !STATIC_TIMES.include?(reminder.start_time.strftime('%-H:%M'))
  end

  def pick_single_reminder(form, reminder, key)
    tag.div(class: 'flex h-10') do
      form.collection_radio_buttons "#{key}_dow", DOW.map { |d| DayOfWeek.new(d) }, :id, :name do |b|
        b.label(class: 'flex-1') do
          b.radio_button(class: 'peer hidden', checked: checked_if_day?(reminder, b.object.id)) + box_button(b.text)
        end
      end
    end
  end

  def pick_many_reminders(form, reminder, key)
    tag.div(class: 'flex h-10') do
      form.collection_check_boxes "#{key}_dow", DOW.map { |d| DayOfWeek.new(d) }, :id, :name do |b|
        b.label(class: 'flex-1') do
          b.check_box(class: 'peer hidden', checked: checked_if_day?(reminder, b.object.id)) + box_button(b.text)
        end
      end
    end
  end

  def daily_check_box(_form, key, day, i)
    tag.label class: 'flex-1' do
      radio_button_tag("#{key}_dow", i, false, class: 'peer hidden', checked: true) + box_button(day.capitalize[0..2])
    end.html_safe
  end

  def custom_reminder_times
    today = Date.today
    stamp = Time.new(today.year, today.month, today.day)
    times = []
    48.times do
      times << [stamp.strftime('%-I:%M%P'), stamp.strftime('%H:%M')]
      stamp += 30.minutes
    end
    times
  end
end
