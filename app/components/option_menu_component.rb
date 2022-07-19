# frozen_string_literal: true

class OptionMenuComponent < ViewComponent::Base
  include ApplicationHelper
  def initialize(object:, options: {})
    @object = object
    @icon = options[:icon] || 'three-dots'
  end
end
