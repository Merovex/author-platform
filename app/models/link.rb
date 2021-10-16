class Link < ApplicationRecord

  validates :url, presence: true, uniqueness: true
  validates :url, format: URI::regexp(%w[http https])
  validates :slug, presence: true, uniqueness: true
  attribute :slug, :string, default: lambda {
    loop do
      slug = SecureRandom.uuid.split('-').first
      return slug unless exists?(slug: slug)
    end
  }
  def short
    Rails.application.routes.url_helpers.short_url(slug: self.slug, only_path: true)
  end
  def to_param
    slug
  end
end
