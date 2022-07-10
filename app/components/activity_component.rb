# frozen_string_literal: true

class ActivityComponent < ViewComponent::Base
  include UsersHelper
  include LocalTimeHelper
  def initialize(activity:)
    @activity = activity
    # @owner = activity.owner
    # @time = @activity.created_at
  end
end
