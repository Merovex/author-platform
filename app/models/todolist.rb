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
class Todolist < ApplicationRecord
  acts_as_paranoid

  include PublicActivity::Model
  tracked owner: proc { Current.user }

  belongs_to :user, default: -> { Current.user }
  has_many :todos
  has_many :comments, as: :commentable
  has_rich_text :content
  # has_one :todolist, as: :todolistable
  belongs_to :todolistable, polymorphic: true # , optional: true

  validates_presence_of :name
  def to_s
    name
  end
end
