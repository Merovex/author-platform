# frozen_string_literal: true

class CardComponent < ViewComponent::Base
  include ComponentsHelper
  def initialize(object:, link: nil)
    @link = link
    @object = object
  end
end
