# frozen_string_literal: true

class StaticComponent < ViewComponent::Base
  def initialize(title:)
    @title = title
  end
end
