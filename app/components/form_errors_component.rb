# frozen_string_literal: true

class FormErrorsComponent < ViewComponent::Base
  def initialize(object:)
    @object = object
  end
end
