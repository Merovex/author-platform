# frozen_string_literal: true

module Sluggable
  extend ActiveSupport::Concern
  def to_param
    [title.to_s.parameterize, slug].join('-')
  end
end
