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
class Todo < ApplicationRecord
  acts_as_paranoid

  include PublicActivity::Model
  tracked owner: proc { Current.user }

  belongs_to :created_by, class_name: 'User', default: -> { Current.user }
  belongs_to :assigned_to, class_name: 'User', optional: true
  belongs_to :todolist
  has_rich_text :description
  has_many :comments, as: :commentable

  validates_presence_of :summary
  scope :in_progress, -> { where('done_at IS NULL') }
  scope :done, -> { where('done_at IS NOT NULL') }
  def to_s
    summary
  end
end
