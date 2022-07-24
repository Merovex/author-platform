class Current < ActiveSupport::CurrentAttributes
  attribute :user
  attribute :page
  attribute :timezone
  attribute :tz_offset
  def tz_offset
    Time.now.in_time_zone(Current.timezone).utc_offset / 3600
  end
end
