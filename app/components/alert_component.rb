# frozen_string_literal: true

class AlertComponent < ViewComponent::Base
  def initialize(title:, message:, type:)
    @title = title.titlecase
    @message = message
    @type = type
    @bg = { 
      "alert" => 'bg-amber-500 text-black dark:bg-amber-400',
      "info" => 'bg-blue-500 text-white dark:bg-blue-600',
      "error" => 'bg-red-500 text-white dark:bg-red-600',
      "notice" => 'bg-emerald-600 text-white dark:bg-emerald-700'
    }[type] || 'bg-brand-500 text-white dark:bg-brand-600'
    # @bg = 'bg-brand' if bg.blank?
  end
end
# "error" => 'bg-[#d20053] text-white dark:bg-red-600',
# "alert" => 'bg-[#ffa405] text-black dark:bg-yellow-400',