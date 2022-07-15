# == Schema Information
#
# Table name: reminders
#
#  id              :bigint           not null, primary key
#  days            :string
#  frequency       :string           default("daily")
#  recurring       :text
#  remindable_type :string
#  reminded_at     :datetime
#  start_time      :datetime
#  week_start      :integer          default(0)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  remindable_id   :integer
#
class Reminder < ApplicationRecord
  serialize :recurring, Hash
  serialize :days, Array

  belongs_to :remindable, polymorphic: true

  before_save :set_schedule

  # Synthetic to allow me to use the nested_fields_for helper
  attribute :custom
  attribute :tod
  attribute :daily
  attribute :weekly
  attribute :fortnightly
  attribute :monthly

  attribute :days, default: [:monday, :tuesday, :wednesday, :thursday, :friday]
  attribute :frequency, default: 'daily'
  attribute :start_time, default: Time.parse('9:00')
  attribute :recurring, default: {
    start_time: DateTime.now.change({ hour: 6, min: 0, sec: 0 }),
    rrules: [{
      validations: { day: [1, 2, 3, 4, 5] },
      rule_type: 'IceCube::DailyRule',
      interval: 1,
      week_start: 0
    }],
    rtimes: [],
    extimes: []
  }
  def rule
    IceCube::Schedule.from_hash(recurring)
  end
  def should_send_reminder?
    return false unless rule.occurring_between?(Time.now - 10.minutes, Time.now + 10.minutes)
    return (reminded_at.nil? || reminded_at < Time.now - 15.minutes)
  end
  def set_schedule
    today = Time.now.change({ hour: start_time.hour, min: start_time.min, sec: 0 }) #- Current.tz_offset.hours
    
    today -= Current.tz_offset.hours

    schedule = IceCube::Schedule.new(today)
    dow = days.map(&:to_sym)
    
    case frequency
      when 'daily'
        schedule.add_recurrence_rule IceCube::Rule.daily(1).day(dow)
      when 'weekly'
        schedule.add_recurrence_rule IceCube::Rule.weekly(1).day(dow)
      when 'fortnightly'
        schedule.add_recurrence_rule IceCube::Rule.weekly(2).day(dow)
      when 'monthly'
        schedule.add_recurrence_rule IceCube::Rule.monthly.day_of_week({ dow.first => [1] })
      end
      
    write_attribute(:recurring, schedule.to_hash)
  end

  def to_s
    rule.to_s
  end
end
