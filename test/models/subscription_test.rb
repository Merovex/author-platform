# == Schema Information
#
# Table name: subscriptions
#
#  id          :bigint           not null, primary key
#  books       :string
#  deleted_at  :datetime
#  posts       :string
#  slug        :string
#  source_type :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_subscriptions_on_books       (books)
#  index_subscriptions_on_deleted_at  (deleted_at)
#  index_subscriptions_on_posts       (posts)
#  index_subscriptions_on_slug        (slug)
#  index_subscriptions_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'test_helper'

class SubscriptionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
