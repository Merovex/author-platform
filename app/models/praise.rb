class Praise < ApplicationRecord
  belongs_to :book
  has_rich_text :comment
end
