# == Schema Information
#
# Table name: books
#
#  id          :bigint           not null, primary key
#  cover_color :string           default("#888888")
#  deleted_at  :datetime
#  is_featured :boolean          default(FALSE)
#  position    :integer
#  released_on :date
#  slug        :string
#  tagline     :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  series_id   :integer
#
# Indexes
#
#  index_books_on_deleted_at   (deleted_at)
#  index_books_on_is_featured  (is_featured)
#  index_books_on_released_on  (released_on)
#  index_books_on_slug         (slug)
#  index_on_book_position      (position)
#
class Book < ApplicationRecord
  acts_as_paranoid
  acts_as_list scope: :series

  include Sluggable
  include Slug

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

  has_many :cast_members, dependent: :destroy
  has_many :characters, through: :cast_members

  scope :featured, -> { where(is_featured: true) }
  scope :unpublished, -> { where('released_on > ? OR released_on IS NULL', Time.now) }
  scope :published, -> { where('released_on <= ?', Time.now) }

  validates :title, presence: true
  
  def siblings
    series.books.published.sort_by(&:position)
  end
  def prep_build
    authors.build(user: Current.user) # << Current.user
    self.project = Project.new
  end
  def user
    authors.first&.user
  end
  def to_s
    title
  end
  def is_released?
    return false if released_on.nil?

    released_on <= DateTime.now
  end
end
