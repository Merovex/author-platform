# == Schema Information
#
# Table name: series
#
#  id         :bigint           not null, primary key
#  deleted_at :datetime
#  slug       :string
#  synopsis   :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_series_on_deleted_at  (deleted_at)
#  index_series_on_slug        (slug)
#
require 'test_helper'

class SeriesTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
