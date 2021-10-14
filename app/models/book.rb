class Book < ApplicationRecord
  include Sluggable
  include Clickable
  
  has_rich_text :synopsis
  has_rich_text :excerpt

  has_one_attached :cover, dependent: :destroy
  has_one_attached :hero_background, dependent: :destroy

  has_one :episode, dependent: :destroy
  has_one :series, through: :episode
  accepts_nested_attributes_for :episode, allow_destroy: true

  has_many :praises
  has_many :authors

  scope :featured, -> { where(is_featured: true) }
  def thumb
    cover.variant(auto_orient: true, rotate: 0, resize: "200x300^", crop: '200x300+0+0')
  end
  def background
    cover.variant(auto_orient: true, rotate: 0, resize: "200x300^", crop: '200x300+0+0')
  end
  def to_s
    title
  end
end
