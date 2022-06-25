class Praise < ApplicationRecord
  acts_as_paranoid
  belongs_to :book
  has_rich_text :comment
end
