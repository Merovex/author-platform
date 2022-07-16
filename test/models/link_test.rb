# == Schema Information
#
# Table name: links
#
#  id            :bigint           not null, primary key
#  clicked       :integer          default(0)
#  comment       :text
#  css           :string
#  deleted_at    :datetime
#  linkable_type :string
#  slug          :string
#  url           :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  bookstore_id  :integer
#  linkable_id   :integer
#
# Indexes
#
#  index_links_on_deleted_at  (deleted_at)
#
require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
