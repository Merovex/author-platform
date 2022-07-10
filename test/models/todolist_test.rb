# == Schema Information
#
# Table name: todolists
#
#  id                :bigint           not null, primary key
#  deleted_at        :datetime
#  name              :string
#  todolistable_type :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  todolistable_id   :integer
#  user_id           :bigint           not null
#
# Indexes
#
#  index_todolists_on_deleted_at  (deleted_at)
#  index_todolists_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'test_helper'

class TodolistTest < ActiveSupport::TestCase
  context 'associations' do
    should have_many(:comments)
    # should belong_to(:user)
    should belong_to(:todolistable)
    should have_many(:todos)
    should have_rich_text(:content)
  end
  context 'validations' do
    should validate_presence_of(:name)
  end
end
