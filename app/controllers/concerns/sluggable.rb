# frozen_string_literal: true

module Sluggable
  extend ActiveSupport::Concern

  def to_param
    [title.to_s.parameterize, slug].join('-')
  end

  module ClassMethods
    # def find_using_slug(param)
    #   slug = param.split('-').last || param
    #   where(slug: slug).limit(1).first
    # end
  end
end
