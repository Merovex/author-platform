u.# frozen_string_literal: true

module Subscriber
  extend ActiveSupport::Concern

  included do
    # after_commit :register_user, on: :create
    has_one :subscription, dependent: :destroy
    after_commit :subscribe_all, on: :create

    def subscribe_all
      sub = create_subscription
    end
  end

  module ClassMethods
    def self.subscribers(source)
      
    end
  end
end
