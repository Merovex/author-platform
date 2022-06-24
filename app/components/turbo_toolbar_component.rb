# frozen_string_literal: true

class TurboToolbarComponent < ViewComponent::Base
  include Turbo::FramesHelper
  def initialize(object:)
    @object = object
  end
end
