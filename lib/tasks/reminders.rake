desc "count the number of users in the system"
task send_reminders: [:environment] do
  # puts User.count
  # puts Reminder.all.inspect
  now = Time.now + 1.days
  puts now.inspect
  Reminder.all.each do |reminder|
    reminder.rule.occurrences_between(now, now + 15.min, spans: true).each do |occurrance|
      puts reminder.rule.to_s
      puts "Send #{reminder.remindable.inspect} reminder"
      u = User.first
      ReminderMailer.reminder_email(u, reminder.remindable).deliver_now
    end
  end
end