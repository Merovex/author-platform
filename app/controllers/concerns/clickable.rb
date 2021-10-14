# frozen_string_literal: true

module Clickable
  extend ActiveSupport::Concern

  included do
    has_many :clicks, dependent: :destroy, as: :clickable
  end
  module ClassMethods
    
  end
end
