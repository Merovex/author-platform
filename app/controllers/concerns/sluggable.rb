# frozen_string_literal: true

module Sluggable
  extend ActiveSupport::Concern

  included do
    validates :slug, presence: true, uniqueness: true
    attribute :slug, :string, default: lambda {
      loop do
        slug = SecureRandom.uuid.split('-').first
        return slug unless exists?(slug: slug)
      end
    }
  end

  def to_param
    [title.to_s.parameterize, slug].join('-')
  end

  module ClassMethods
    def find_using_slug(param)
      slug = param.split('-').last || param
      where(slug: slug).limit(1).first
    end
  end
end
