class Post < ApplicationRecord
  include Sluggable
  include Slug

  acts_as_paranoid # Soft delete
  include PublicActivity::Model # Trackable item.
  tracked owner: Proc.new{ Current.user }

  acts_as_notifiable :users#, tracked: { only: [:create] } # Allows notification to be sent to all subscribers.

  belongs_to :user, default: -> { Current.user }
  has_rich_text :content
  has_many_attached :images
  
  validates :title, presence: true
  
  

  scope :published, -> { where.not(published_at: nil).or(where('published_at < ?', Time.now.utc)) }
  scope :unpublished, -> { where(published_at: nil).or(where.not('published_at < ?', Time.now.utc)) }

  def author_name
    return user.email if user.name.blank?

    user.name
  end

  def publish_now
    write_attribute(:published_at, Time.now.utc)
  end

  def unpublish
    write_attribute(:published_at, nil)
  end

  def unbroadcasted?
    broadcasted_at.nil?
  end
  def is_published?
    return false if published_at.nil?
    
    return published_at <= Time.now.utc
  end
  def broadcastable?
    return false if published_at.nil?
    return true if broadcasted_at.nil?
    return false if published_at > broadcasted_at
    return true
  end

  def broadcast_now
    # Set time of broadcast to the current time.
    write_attribute(:broadcasted_at, Time.now.utc)
  end
end
