class Post < ApplicationRecord
  acts_as_paranoid
  include Sluggable
  include Slug

  belongs_to :user
  has_rich_text :content
  has_many_attached :images

  scope :published, -> { where('published_at < ?', Time.now.utc) }
  scope :unpublished, -> { where('published_at > ?', Time.now.utc).or(where(published_at: nil)) }

  def author_name
    return user.email if user.name.blank?

    user.name
  end

  def publish_now
    write_attribute(:published_at, Time.now.utc)
  end

  def unpublish
    # Unpublish a published post
    write_attribute(:published_at, nil)
  end

  def unbroadcasted?
    broadcasted_at.nil?
  end

  def broadcastable?
    (broadcasted_at.nil? && !published_at.nil? && published_at < Time.now.utc)
  end

  def broadcast_now
    # Set time of broadcast to the current time.
    write_attribute(:broadcasted_at, Time.now.utc)
  end
end
