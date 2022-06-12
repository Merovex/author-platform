class Post < ApplicationRecord
  include Sluggable
  before_create :set_slug
  attribute :slug, :string
  def set_slug
    loop do
      self.slug = slug = SecureRandom.base64(6).tr('+/=','')
      break unless Post.where(slug: slug).exists?
    end
  end
  belongs_to :user
  has_rich_text :content
  
  def publish_now
    write_attribute(:published_at, Time.now.utc)
  end
  def broadcast_now
    write_attribute(:broadcasted_at, Time.now.utc)
  end
  def unpublish
    write_attribute(:published_at, nil)
  end
  def self.published 
    where("published_at < ?", Time.now.utc)
  end
  def self.pending_published
    where("published_at > ?", Time.now.utc).or(self.where(published_at: nil))
  end
end
