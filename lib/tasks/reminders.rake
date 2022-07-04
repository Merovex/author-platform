desc 'count the number of users in the system'
task send_reminders: [:environment] do
  # puts User.count
  # puts Reminder.all.inspect
  now = Time.now
  # puts now.inspect
  Reminder.all.each do |reminder|
    reminder.rule.occurrences_between(now - 15.minutes, now + 15.minutes, spans: true).each do |_occurrance|
      puts reminder.rule.to_s
      puts "Send #{reminder.remindable.inspect} reminder"
      u = User.first
      ReminderMailer.reminder_email(u, reminder.remindable).deliver_now
    end
  end
end
