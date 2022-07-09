desc 'count the number of users in the system'
task send_reminders: [:environment] do
  now = Time.now
  puts now.inspect
  Reminder.all.each do |reminder|
    puts "Reminders considering: #{reminder.to_json}"
    puts "#{reminder.rule.occurrences_next(2)}"
    reminder.rule.occurrences_between(now - 5.minutes, now + 10.minutes, spans: true).each do |_occurrance|
      puts "Sending #{reminder.remindable.inspect} reminder (#{reminder.rule}"
      u = User.first
      ReminderMailer.reminder_email(u, reminder.remindable).deliver_now
    end
  end
end
