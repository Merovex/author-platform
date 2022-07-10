# == Schema Information
#
# Table name: memberships
#
#  id                  :bigint           not null, primary key
#  committed           :boolean          default(TRUE)
#  deleted_at          :datetime
#  membershipable_type :string           not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  membershipable_id   :bigint           not null
#  user_id             :bigint           not null
#
# Indexes
#
#  index_memberships_on_membershipable  (membershipable_type,membershipable_id)
#  index_memberships_on_user_id         (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class MembershipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
