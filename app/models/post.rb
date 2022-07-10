# == Schema Information
#
# Table name: posts
#
#  id             :bigint           not null, primary key
#  broadcasted_at :datetime
#  deleted_at     :datetime
#  published_at   :datetime
#  slug           :string
#  title          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :bigint           not null
#
# Indexes
#
#  index_posts_on_deleted_at  (deleted_at)
#  index_posts_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Post < ApplicationRecord
  include Sluggable
  include Slug

  acts_as_paranoid # Soft delete
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

  def to_s
    title
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

    published_at <= Time.now.utc
  end

  def broadcastable?
    return false if published_at.nil?
    return true if broadcasted_at.nil?
    return false if published_at > broadcasted_at

    true
  end

  def broadcast_now
    # Set time of broadcast to the current time.
    write_attribute(:broadcasted_at, Time.now.utc)
  end
end
