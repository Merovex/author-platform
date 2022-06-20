# frozen_string_literal: true

module Slug
  extend ActiveSupport::Concern
  def self.included(base)
    base.extend ClassMethods
    base.before_create :set_slug
  end
  def set_slug
    loop do
      self.slug = SecureRandom.base64(4).tr('+/=','')
      slug = self.slug
      break unless Book.where(slug: slug).exists?
    end
  end
  module ClassMethods
    def find_using_slug(param)
      slug = param.split('-').last || param
      where(slug: slug).limit(1).first
    end
    def unique_slug(key)
      loop do
        slug = SecureRandom.base64(4).tr('+/=','')
        return slug unless self.where({key.to_sym => slug}).exists?
      end
    end
  end
end
