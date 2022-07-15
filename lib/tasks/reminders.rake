desc 'count the number of users in the system'
task send_reminders: [:environment] do
  now = Time.now
  puts now.inspect
  Reminder.all.each do |reminder|
    puts "Reminder #{reminder.id} sends #{reminder.rule}"
    puts "  Next Occurrance: #{reminder.rule.next_occurrence}"
    puts "  Should Send: #{reminder.should_send_reminder?}"
    if reminder.should_send_reminder?
      puts "  Sending #{reminder.remindable.inspect} reminder (#{reminder.rule})"
      reminder.update(reminded_at: Time.now)
      SendCheckinReminderNotification.with(reminder: reminder, remindable: reminder.remindable).deliver(User.first)
    end
  end
end
