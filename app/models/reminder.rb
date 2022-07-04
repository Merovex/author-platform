class Reminder < ApplicationRecord
  serialize :recurring, Hash
  serialize :days, Array

  belongs_to :remindable, polymorphic: true

  before_save :set_schedule

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
  def recurring_start_time
    recurring[:start_time]
  end
  def set_schedule
    today = Time.now.change({ hour: start_time.hour, min: start_time.min, sec: 0 })

    schedule = IceCube::Schedule.new(today)
    # raise [today, fnord, schedule].inspect
    dow = days.map(&:to_sym)
    # Get the rule type and set the rule
    if frequency == 'monthly' # First Day of Week of the Month...
      schedule.add_recurrence_rule IceCube::Rule.monthly.day_of_week({ dow.first => [1] })
    elsif frequency == 'fortnightly'
      schedule.add_recurrence_rule IceCube::Rule.weekly(2).day(dow)
    else # Daily or weekly (default) (one or more days of the week)
      schedule.add_recurrence_rule IceCube::Rule.weekly(1).day(dow)
    end
    write_attribute(:recurring, schedule.to_hash)
  end

  def to_s
    rule.to_s
  end
end
