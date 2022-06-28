# frozen_string_literal: true

class OptionMenuComponent < ViewComponent::Base
  include ApplicationHelper
  def initialize(object:)
    @object = object
  end
end
