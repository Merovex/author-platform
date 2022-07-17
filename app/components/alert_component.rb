# frozen_string_literal: true

class AlertComponent < ViewComponent::Base
  def initialize(title:, message:, type:)
    @title = title.titlecase
    @message = message
    @type = type
    @bg = { 
      "alert" => 'bg-warning text-black dark:bg-warning-dark dark:text-warning-light',
      "info" => 'bg-info text-info-dark dark:bg-info-dark',
      # "error" => 'bg-danger text-danger-dark dark:bg-red-600',
      "notice" => 'bg-success text-success-dark dark:text-success-light dark:bg-success-dark'
    }[type] || 'bg-brand-500 text-white dark:bg-brand-600'
    # @bg = 'bg-brand text-brand-light'
    # @bg = 'bg-brand' if bg.blank?
  end
end
# "error" => 'bg-[#d20053] text-white dark:bg-red-600',
# "alert" => 'bg-[#ffa405] text-black dark:bg-yellow-400',