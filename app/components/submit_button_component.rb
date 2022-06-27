# frozen_string_literal: true

class SubmitButtonComponent < ViewComponent::Base
  include ApplicationHelper
  def initialize(form:, label: 'Submit', path: :back, inline: false)
    @form = form
    @label = label
    @path = path
  end
end
