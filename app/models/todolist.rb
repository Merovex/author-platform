class Todolist < ApplicationRecord
  acts_as_paranoid

  include PublicActivity::Model
  tracked owner: Proc.new{ Current.user }
  
  belongs_to :user, default: -> { Current.user }
  has_many :todos
  has_many :comments, as: :commentable
  has_rich_text :content
  # has_one :todolist, as: :todolistable
  belongs_to :todolistable, polymorphic: true, optional: true

  validates_presence_of :name
end
