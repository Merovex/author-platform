# frozen_string_literal: true

module Sluggable
  extend ActiveSupport::Concern

  # included do
  #   before_create :set_slug
  #   attribute :slug, :string#, default: unique_slug(:slug)
  # end
  # def set_slug
  #   loop do
  #     self.slug = SecureRandom.base64(6).tr('+/=','')
  #     break unless exists?(slug: slug)
  #     # break unless Post.where(slug: slug).exists?
  #   end
  # end

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
