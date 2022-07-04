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
    # raise Time.now.change({ hour: start_time.hour, min: start_time.min, sec: 0 }).inspect
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

  # def days
  #   return recurring[:rrules].first[:validations][:day] unless recurring[:rrules].first[:validations][:day].nil?

  #   recurring[:rrules].first[:validations][:day_of_week].keys # This supports the Monthly rule
  # end

  # def rules(key = :start_time)
  #   puts inspect
  #   ans = nil
  #   key = key.to_sym
  #   if key == :start_time
  #     ans = recurring[:start_time]
  #   elsif key == :rule_type
  #     ans = recurring[:rrules].first[:rule_type]
  #   elsif key == :interval
  #     ans = recurring[:rrules].first[:interval]
  #   elsif key == :days
  #     ans = recurring[:rrules].first[:validations][:day]
  #   end
  #   ans
  # end

  def to_s
    rule.to_s
  end

  # def recurring=(args)
  #   schedule = (rule.nil?) ? nil : rule
    
  #   rule_type = args['rule_type']

  #   raise schedule.to_hash.inspect
  #   # Days of the Week can either be a single day of the week or an array of days of the week
  #   # need to convert to array if it is not
  #   unless args['rule_type'].nil?
  #     dow = if args["#{rule_type}_dow"].is_a?(Array)
  #             args["#{rule_type}_dow"].reject { |c| c.empty? }
  #           else
  #             args["#{rule_type}_dow"].split
  #           end
  #   end
  #   # Convert the time of day to a Time object and use it to set the schedule start time
  #   time_of_day = (args['tod'] == 'custom') ? args['custom'] : args['tod']
  #   time_of_day = Time.parse(time_of_day)
  #   today = Time.new.change({ hour: time_of_day.hour, min: time_of_day.min, sec: 0 })

  #   schedule = IceCube::Schedule.new(today) if schedule.nil?

  #   # Get the rule type and set the rule
  #   if rule_type == 'monthly' # First Day of Week of the Month...
  #     schedule.add_recurrence_rule IceCube::Rule.monthly.day_of_week({ dow.map(&:to_sym).first => [1] })
  #   elsif rule_type == 'fortnightly'
  #     schedule.add_recurrence_rule IceCube::Rule.weekly(2).day(dow.map(&:to_sym))
  #   else # Daily or weekly (default) (one or more days of the week)
  #     schedule.add_recurrence_rule IceCube::Rule.weekly(1).day(dow.map(&:to_sym))
  #   end

  #   write_attribute(:recurring, schedule.to_hash)
  # end
end
