class Book < ApplicationRecord
  acts_as_paranoid
  acts_as_list scope: :series

  include Sluggable
  include Slug

  include PublicActivity::Model
  tracked owner: proc { Current.user }

  attribute :cover_color, :string, default: '#888888'
  attribute :status, :string, default: 'wip'

  has_rich_text :synopsis
  has_rich_text :excerpt

  has_one_attached :cover, dependent: :destroy
  has_one_attached :hero_background, dependent: :destroy

  belongs_to :series

  accepts_nested_attributes_for :series

  has_one :project, dependent: :destroy
  before_create :prep_build

  has_many :praises, dependent: :destroy

  has_many :authors, dependent: :destroy
  has_many :users, through: :authors

  has_many :links, as: :linkable, dependent: :destroy
  has_many :writing_entries, through: :project, as: :entries
  # belongs_to :clickable, polymorphic: true, optional: true

  scope :featured, -> { where(is_featured: true) }
  scope :unpublished, -> { where('released_on > ? OR released_on IS NULL', Time.now) }
  scope :published, -> { where('released_on <= ?', Time.now) }

  validates :title, presence: true
  validates :synopsis, presence: true

  def prep_build
    authors.build(user: Current.user) # << Current.user
    self.project = Project.new
  end

  def to_s
    title
  end

  def is_released?
    return false if released_on.nil?

    released_on <= DateTime.now
  end
end
