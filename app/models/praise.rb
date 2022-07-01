class Praise < ApplicationRecord
  acts_as_paranoid
  acts_as_list scope: :book
  
  belongs_to :book
  has_rich_text :comment
  validates :comment, presence: true
  
  include PublicActivity::Model
  tracked owner: Proc.new{ Current.user }
end
