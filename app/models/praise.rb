class Praise < ApplicationRecord
  acts_as_paranoid
  belongs_to :book
  has_rich_text :comment
  include PublicActivity::Model
  tracked owner: Proc.new{ Current.user }
end
