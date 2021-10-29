class Post < ApplicationRecord
  belongs_to :user
  has_rich_text :content

  include Sluggable
  
  def self.published 
    where("published_at < ?", Time.now)
  end
  def self.pending_published
    # where("published_at > ? and published_at is null")
    where("published_at is ?", nil).or(self.where("published_at > ?", Time.now))
  end
end
