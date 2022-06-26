
class Book < ApplicationRecord
  acts_as_paranoid
  acts_as_list
  
  include Slug, Sluggable

  attribute :cover_color, :string, default: "#888888"
  attribute :status, :string, default: "wip"
  
  has_rich_text :synopsis
  has_rich_text :excerpt

  has_one_attached :cover, dependent: :destroy
  has_one_attached :hero_background, dependent: :destroy

  belongs_to :series
  
  accepts_nested_attributes_for :series

  has_one :bucket, dependent: :destroy
  before_create :build_bucket
  
  has_many :praises, dependent: :destroy
  has_many :authors
  has_many :links, as: :linkable, dependent: :destroy
  has_many :writing_entries, through: :bucket, as: :entries
  # belongs_to :clickable, polymorphic: true, optional: true

  scope :featured, -> { where(is_featured: true) }
  scope :unpublished, -> { where("released_on > ? OR released_on IS NULL", DateTime.now) }
  scope :published, -> { where("released_on <= ?", DateTime.now) }

  def order
    return "" if series.nil?
    return episode.order
  end

  # def bgcolor
  #   cover.variant(auto_orient: true, rotate: 0, resize: "1x1^", negate: true)#.processed.url
  # end
  def to_s
    title
  end
  def is_released?
    return false if released_on.nil?
    return released_on <= DateTime.now
  end
end
