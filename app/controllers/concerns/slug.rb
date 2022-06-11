# frozen_string_literal: true

module Slug
  extend ActiveSupport::Concern

  module ClassMethods
    def make_slug
      SecureRandom.base64(6).tr('+/=','')
    end
    def unique_slug(key)
      puts "HERE".inspect
      loop do
        slug = SecureRandom.base64(6).tr('+/=','')
        puts "Slug: #{slug}".inspect
        # return nil unless self.exists?
        return slug unless self.exists?({key.to_sym => slug})
      end
    end
  end
end
