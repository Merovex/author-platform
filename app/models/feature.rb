class Feature < ApplicationRecord
  has_rich_text :content
  validates :name, presence: true
  validates :summary, presence: true

  scope :draft, -> { where('released_on > ? OR released_on IS NULL', Time.now) }
  scope :released, -> { where('released_on <= ?', Time.now) }
end
