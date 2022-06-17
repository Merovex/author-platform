
class Book < ApplicationRecord
  
  include Slug, Sluggable

  attribute :cover_color, :string, default: "#888888"
  attribute :status, :string, default: "wip"
  
  has_rich_text :synopsis
  has_rich_text :excerpt

  has_one_attached :cover, dependent: :destroy
  has_one_attached :hero_background, dependent: :destroy

  has_one :episode, dependent: :destroy
  has_one :series, through: :episode
  
  accepts_nested_attributes_for :episode, allow_destroy: true

  has_one :writing_goal, dependent: :destroy
  before_create :build_writing_goal
  
  has_many :praises, dependent: :destroy
  has_many :authors
  has_many :links, as: :linkable, dependent: :destroy
  # belongs_to :clickable, polymorphic: true, optional: true

  scope :featured, -> { where(is_featured: true) }
  scope :unpublished, -> { where("released_on > ? OR released_on IS NULL", DateTime.now) }
  scope :published, -> { where("released_on <= ?", DateTime.now) }

  def thumb
    cover.variant(auto_orient: true, rotate: 0, resize: "200x300^", crop: '200x300+0+0', format: :webp)#.processed.url
  end
  def background
    hero_background.variant(auto_orient: true, rotate: 0, resize: "1600x900^", crop: '1600x900+0+0')#.processed.url
  end
  def bgcolor
    cover.variant(auto_orient: true, rotate: 0, resize: "1x1^", negate: true)#.processed.url
  end
  def to_s
    title
  end
  def is_released?
    return false if released_on.nil?
    return released_on <= DateTime.now
  end
end
