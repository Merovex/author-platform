class Todolist < ApplicationRecord
  acts_as_paranoid
  
  belongs_to :user, default: -> { Current.user }
  has_many :todos
  has_rich_text :content
  has_one :todolist, as: :todolistable

  validates_presence_of :name
end
