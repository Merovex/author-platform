# == Schema Information
#
# Table name: reminders
#
#  id              :bigint           not null, primary key
#  days            :string
#  frequency       :string           default("daily")
#  recurring       :text
#  remindable_type :string
#  reminded_at     :datetime
#  start_time      :datetime
#  week_start      :integer          default(0)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  remindable_id   :integer
#
require 'test_helper'

class ReminderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
