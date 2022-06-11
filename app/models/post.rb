class Post < ApplicationRecord
  include Sluggable
  belongs_to :user
  has_rich_text :content
  
  def publish_now
    write_attribute(:published_at, Time.now.utc)
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
