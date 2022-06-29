# frozen_string_literal: true

module Slug
  extend ActiveSupport::Concern
  def self.included(base)
    base.extend ClassMethods
    base.before_create :set_slug
  end

  def set_slug
    loop do
      self.slug = SecureRandom.base64(4).tr('+/=', '')
      slug = self.slug
      break unless Book.where(slug:).exists?
    end
  end

  module ClassMethods

    def find_by!(arg, *args)
      unless arg[:id].nil?
        input = arg[:id]
        if (input.to_i.to_s != input.to_s)
          arg[:slug] = input.split('-').last
          arg.delete(:id)
        end
      end
      super
    end
    def find(input)
      if input.class == Array
        super
      else
        input.to_i.to_s == input.to_s ? super : find_using_slug(input)
      end
    end
    def find_using_slug(param)
      # raise param.inspect
      slug = param.split('-').last || param
      where(slug:).limit(1).first
    end

    def unique_slug(key)
      loop do
        slug = SecureRandom.base64(4).tr('+/=', '')
        return slug unless where({ key.to_sym => slug }).exists?
      end
    end
  end
end
