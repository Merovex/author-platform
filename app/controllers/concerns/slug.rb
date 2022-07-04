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
      break unless self.class.find(slug)
    end
  end

  module ClassMethods
    # https://github.com/hungrymedia/superslug
    # Overloading the default find_by method to allow for slug or id
    def find_by!(arg, *args)
      unless arg[:id].nil?
        input = arg[:id]
        if input.to_i.to_s != input.to_s
          arg[:slug] = input.split('-').last
          arg.delete(:id) # remove the ID from the hash since it's not a valid attribute
        end
      end
      super
    end

    # https://github.com/hungrymedia/superslug
    # Overloading the default find method to allow for slug or id
    def find(input)
      if input.instance_of?(Array)
        super
      else
        input.to_i.to_s == input.to_s ? super : find_using_slug(input)
      end
    end

    def find_using_slug(param)
      slug = param.split('-').last || param
      where(slug:).limit(1).first
    end

    # create random/unique slug
    def unique_slug(key)
      loop do
        slug = SecureRandom.base64(4).tr('+/=', '')
        return slug unless where({ key.to_sym => slug }).exists?
      end
    end
  end
end
