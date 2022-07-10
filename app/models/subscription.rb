# == Schema Information
#
# Table name: subscriptions
#
#  id          :bigint           not null, primary key
#  books       :string
#  deleted_at  :datetime
#  posts       :string
#  slug        :string
#  source_type :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_subscriptions_on_books       (books)
#  index_subscriptions_on_deleted_at  (deleted_at)
#  index_subscriptions_on_posts       (posts)
#  index_subscriptions_on_slug        (slug)
#  index_subscriptions_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Subscription < ApplicationRecord
  acts_as_paranoid
  belongs_to :user

  include Slug
  before_create :set_subscriptions

  def to_param
    slug
  end

  # attribute :posts, :string, default: unique_slug(:posts)
  # attribute :books, :string, default: unique_slug(:books)
  def set_subscriptions
    unique_slug(:posts)
    unique_slug(:books)
  end

  def change(attr)
    read_attribute(attr.to_sym).nil? ? subscribe(attr) : unsubscribe(attr)
    self
  end

  def subscribe(attr)
    slug = unique_slug(attr.to_sym)
    write_attribute(attr.to_sym, slug)
    self
  end

  def unsubscribe(attr)
    write_attribute(attr.to_sym, nil)
    self
  end

  def self.users(key)
    where.not({ key.to_sym => nil }).map { |o| o.user }
  end

  def find_using_slug(param)
    slug = param.split('-').last || param
    where(slug:).limit(1).first
  end

  protected

  def unique_slug(_key)
    loop do
      slug = SecureRandom.base64(4).tr('+/=', '')
      return slug # unless self.exists?({key.to_sym => slug})
    end
  end
end
