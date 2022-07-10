# == Schema Information
#
# Table name: clicks
#
#  id             :bigint           not null, primary key
#  city           :string
#  clickable_type :string
#  country        :string
#  country_code   :string
#  ip             :string
#  latitude       :float
#  longitude      :float
#  map            :string
#  state          :string
#  state_code     :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  clickable_id   :integer
#  user_id        :bigint
#
# Indexes
#
#  index_clicks_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'test_helper'

class ClickTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
