class Series < ApplicationRecord
  before_create :set_slug
  attribute :slug, :string
  def set_slug
    loop do
      self.slug = SecureRandom.base64(6).tr('+/=','')
      break unless Series.where(slug: slug).exists?
    end
  end
  has_many :episodes
  has_many :books, through: :episodes
end
