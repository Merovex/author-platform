# frozen_string_literal: true

module Sluggable
  extend ActiveSupport::Concern
  include Slug

  included do
    validates :slug, presence: true, uniqueness: true
    attribute :slug, :string#, default: unique_slug(:slug)
    before_create { self.slug = SecureRandom.base64(6).tr('+/=','') }
  end

  def to_param
    if title.present?
      [title.to_s.parameterize, slug].join('-')
    else
      slug
    end
  end

  module ClassMethods
    def find_using_slug(param)
      slug = param.split('-').last || param
      where(slug: slug).limit(1).first
    end
  end
end
