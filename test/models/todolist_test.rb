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
