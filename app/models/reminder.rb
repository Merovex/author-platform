class Reminder < ApplicationRecord
  serialize :recurring, Hash
  belongs_to :remindable, polymorphic: true
  attribute :recurring, default: {
                          start_time: Time.now.change({ hour: 6, min: 0, sec: 0 }),
                          rrules: [{
                            validations: {day: [1,2,3,4,5]},
                            rule_type: "IceCube::DailyRule",
                            interval: 1,
                            week_start: 0
                          }], 
                          rtimes: [],
                          extimes: []
                        }
  def rule
    IceCube::Schedule.from_hash(recurring)
  end
  def frequency
    case recurring[:rrules][0][:rule_type]
    when "IceCube::DailyRule"
      "daily"
    when "IceCube::WeeklyRule"
      (recurring[:rrules].first[:rule_type].include?("Weekly") && recurring[:rrules].first[:interval] == 2) ? "fortnightly" : "weekly"
    when "IceCube::MonthlyRule"
      "monthly"
    end
  end
  def daily?
    return (recurring[:rrules].first[:rule_type].include?("Daily"))
  end
  def weekly?
    return (recurring[:rrules].first[:rule_type].include?("Weekly") && recurring[:rrules].first[:interval] == 1)
  end
  def fortnightly?
    return (recurring[:rrules].first[:rule_type].include?("Weekly") && recurring[:rrules].first[:interval] == 2)
  end
  def monthly?
    return (recurring[:rrules].first[:rule_type].include?("Monthly"))
  end
  def days
    return recurring[:rrules].first[:validations][:day] unless recurring[:rrules].first[:validations][:day].nil?
    return recurring[:rrules].first[:validations][:day_of_week].keys # This supports the Monthly rule
  end
  def start_time
    recurring[:start_time]
  end
  def rules(key = :start_time)
    puts self.inspect
    ans = nil
    key = key.to_sym
    if key == :start_time
      ans = recurring[:start_time]
    elsif key == :rule_type
      ans = recurring[:rrules].first[:rule_type]
    elsif key == :interval
      ans = recurring[:rrules].first[:interval]
    elsif key = :days
      ans = recurring[:rrules].first[:validations][:day]
    end
    return ans
  end
  def to_s
    return rule.to_s
  end
  def recurring=(args)
    args = {"rule_type"=>"monthly", "tod"=>"08:30", "monthly_dow"=>["monday"]}.merge(args)
    rule_type = args["rule_type"]
    time_of_day = args["tod"]

    # Days of the Week can either be a single day of the week or an array of days of the week
    # need to convert to array if it is not
    if args["#{rule_type}_dow"].is_a?(Array)
      dow = args["#{rule_type}_dow"].reject { |c| c.empty? } 
    else
      dow = args["#{rule_type}_dow"].split
    end

    # Convert the time of day to a Time object and use it to set the schedule start time
    time_of_day = time_of_day.split(':').map(&:to_i)
    today = Time.new.change({ hour: time_of_day.first, min: time_of_day.last, sec: 0 })
    schedule = IceCube::Schedule.new(today)
    
    if (rule_type == 'monthly') # First Day of Week of the Month...
      schedule.add_recurrence_rule IceCube::Rule.monthly.day_of_week({dow.map(&:to_sym).first => [1]})
    elsif (rule_type == 'fortnightly')
      schedule.add_recurrence_rule IceCube::Rule.weekly(2).day(dow.map(&:to_sym))
    else # Daily or weekly (default) (one or more days of the week)
      schedule.add_recurrence_rule IceCube::Rule.weekly(1).day(dow.map(&:to_sym))
    end
    # super(schedule.to_hash)
    write_attribute(:recurring, schedule.to_hash)
  end
end
