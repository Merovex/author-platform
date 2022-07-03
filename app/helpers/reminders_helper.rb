class DayOfWeek
  def initialize(day)
    @id = day; @name = day.capitalize[0..2]
    def id; @id; end 
    def name; @name; end
  end
end
module RemindersHelper
  DOW = %i[sunday monday tuesday wednesday thursday friday saturday]
  def label_class
    return "peer-checked:bg-brand-500 inline-flex rounded px-4 text-center"
  end
  def box_button(text)
    tag.span(text, class: label_class)
  end
  def reminder_label(form, rule_type, text)
    tag.summary do 
      tag.label(class: "h-8 block") do
        form.radio_button(:rule_type, 'weekly', class: 'hidden') +
        "#{text} &#8230;".html_safe
      end
    end
  end
  def reminders_daily(form, reminder, key)
    days = reminder.days.map do |day|
      DOW[day].to_sym
    end
    tag.div(class: "flex h-10") do
      form.collection_check_boxes "#{key}_dow", DOW.map{ |d| DayOfWeek.new(d) }, :id, :name do |b|
        # day = DOW[]
        # puts [b.object, b.object.id, days.include?(b.object.id)].inspect
        b.label(class:"flex-1") { b.check_box(class:'peer hidden', checked: checked_if_day?(reminder, b.object.id)) + box_button(b.text) }
      end
    end
  end
  def checked_if_day?(reminder, id)
    reminder.days.map do |day|
      DOW[day].to_sym
    end.include?(id)
  end
  def reminders_weekly(form, reminder, key)
    tag.div(class: "flex h-10") do
      form.collection_radio_buttons "#{key}_dow", DOW.map{ |d| DayOfWeek.new(d) }, :id, :name do |b|
        b.label(class:"flex-1") { b.radio_button(class:'peer hidden', checked: checked_if_day?(reminder, b.object.id)) + box_button(b.text) }
      end
    end
  end
  def daily_check_box(form, key, day, i)
    tag.label class: 'flex-1' do
      radio_button_tag("#{key}_dow", i, false, class: 'peer hidden', checked: true) + box_button(day.capitalize[0..2])
    end.html_safe
  end
  def custom_reminder_times
      @today = Date.today; stamp = Time.new(@today.year, @today.month, @today.day) 
      times = [] 
      48.times do |i| 
        times << stamp.strftime("%H:%M")
        stamp += 30.minutes 
      end
      return times
  end
end
