class Link < ApplicationRecord
  validates :url, presence: true, uniqueness: true
  validates :url, format: URI::regexp(%w[http https])
  # validates :slug, presence: true, uniqueness: true
  include Slug
  # attribute :slug, :string, default: lambda {
  #   loop do
  #     slug = SecureRandom.uuid.split('-').first
  #     return slug unless exists?(slug: slug)
  #   end
  # }
  belongs_to :linkable, polymorphic: true, optional: true
  acts_as_taggable_on :tags

  def short
    Rails.application.routes.url_helpers.short_url(slug: self.slug, only_path: true)
  end
  def to_param
    slug
  end
end
