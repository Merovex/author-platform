# == Schema Information
#
# Table name: announcements
#
#  id                :bigint           not null, primary key
#  announceable_type :string
#  published_at      :datetime
#  summary           :text
#  title             :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  announceable_id   :string
#
require 'test_helper'

class AnnouncementTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
