class Post < ApplicationRecord
  belongs_to :user
  has_rich_text :content

  include Sluggable
  
  def self.published 
    where("published_at < ?", Time.now)
  end
  def self.pending_published
    where("published_at > ?", Time.now)
  end
end
