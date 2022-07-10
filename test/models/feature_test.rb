# == Schema Information
#
# Table name: features
#
#  id          :bigint           not null, primary key
#  name        :string
#  released_on :date
#  summary     :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "test_helper"

class FeatureTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
