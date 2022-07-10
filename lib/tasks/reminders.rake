desc 'count the number of users in the system'
task send_reminders: [:environment] do
  now = Time.now
  puts now.inspect
  Reminder.all.each do |reminder|
    puts "Reminders considering: #{reminder.to_json}"
    puts "#{reminder.rule.next_occurrence}"
    # reminder.rule.occurrences_between(now - 5.minutes, now + 10.minutes, spans: true).each do 
    1.times do
      puts "Sending #{reminder.remindable.inspect} reminder (#{reminder.rule}"
      SendCheckinReminderNotification.with(reminder: reminder, remindable: reminder.remindable).deliver(User.first)
    end
  end
end
