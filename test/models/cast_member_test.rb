# == Schema Information
#
# Table name: cast_members
#
#  id           :bigint           not null, primary key
#  summary      :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  book_id      :bigint           not null
#  character_id :bigint           not null
#
# Indexes
#
#  index_cast_members_on_book_id       (book_id)
#  index_cast_members_on_character_id  (character_id)
#
# Foreign Keys
#
#  fk_rails_...  (book_id => books.id)
#  fk_rails_...  (character_id => characters.id)
#
require "test_helper"

class CastMemberTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
