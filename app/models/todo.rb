class Todo < ApplicationRecord
  acts_as_paranoid

  include PublicActivity::Model
  tracked owner: Proc.new{ Current.user }

  belongs_to :created_by, class_name: 'User', default: -> { Current.user }
  belongs_to :assigned_to, class_name: 'User', optional: true
  belongs_to :todolist
  has_rich_text :description

  validates_presence_of :summary
  scope :in_progress, -> { where('done_at IS NULL') }
  scope :done, -> { where('done_at IS NOT NULL') }
  def to_s
    summary
  end
end
