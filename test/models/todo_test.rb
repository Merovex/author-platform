# == Schema Information
#
# Table name: todos
#
#  id             :bigint           not null, primary key
#  deleted_at     :datetime
#  done_at        :datetime
#  due_on         :date
#  position       :integer
#  summary        :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  assigned_to_id :integer
#  created_by_id  :integer          not null
#  todolist_id    :bigint           not null
#
# Indexes
#
#  index_on_todo_position      (position)
#  index_todos_on_deleted_at   (deleted_at)
#  index_todos_on_todolist_id  (todolist_id)
#
# Foreign Keys
#
#  fk_rails_...  (todolist_id => todolists.id)
#
require 'test_helper'

class TodoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
