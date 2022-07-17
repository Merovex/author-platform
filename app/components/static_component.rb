# frozen_string_literal: true

class StaticComponent < ViewComponent::Base
  include ApplicationHelper
  def initialize(title:)
    @title = title
  end
end
