
class Book < ApplicationRecord
  include Sluggable
  before_create :set_slug
  attribute :slug, :string
  def set_slug
    loop do
      self.slug = SecureRandom.base64(6).tr('+/=','')
      break unless Book.where(slug: slug).exists?
    end
  end

  attribute :cover_color, :string, default: "#888888"
  
  has_rich_text :synopsis
  has_rich_text :excerpt

  has_one_attached :cover, dependent: :destroy
  has_one_attached :hero_background, dependent: :destroy

  has_one :episode, dependent: :destroy
  has_one :series, through: :episode
  accepts_nested_attributes_for :episode, allow_destroy: true

  has_many :praises
  has_many :authors
  has_many :links, as: :linkable, dependent: :destroy

  scope :featured, -> { where(is_featured: true) }
  def thumb
    cover.variant(auto_orient: true, rotate: 0, resize: "200x300^", crop: '200x300+0+0', format: :webp)#.processed.url
  end
  def background
    cover.variant(auto_orient: true, rotate: 0, resize: "200x300^", crop: '200x300+0+0')#.processed.url
  end
  def bgcolor
    cover.variant(auto_orient: true, rotate: 0, resize: "1x1^", negate: true)#.processed.url
  end
  def to_s
    title
  end
end
