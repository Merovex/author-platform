# == Schema Information
#
# Table name: pages
#
#  id         :bigint           not null, primary key
#  deleted_at :datetime
#  slug       :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_pages_on_deleted_at  (deleted_at)
#
require 'test_helper'

class PageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
