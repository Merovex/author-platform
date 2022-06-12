class Subscription < ApplicationRecord
  belongs_to :user

  include Slug
  before_create :set_slug
  attribute :slug, :string
  def set_slug
    loop do
      self.slug = slug = SecureRandom.base64(6).tr('+/=','')
      break unless Subscription.where(slug: slug).exists?
    end
  end
  def to_param
    slug
  end

  attribute :posts, :string, default: unique_slug(:posts)
  attribute :books, :string, default: unique_slug(:books)

  def change(attr)
    (self.read_attribute(attr.to_sym).nil?) ? subscribe(attr) : unsubscribe(attr)
    self
  end
  def subscribe(attr)
    slug = unique_slug(attr.to_sym)
    self.write_attribute(attr.to_sym, slug)
    self
  end
  def unsubscribe(attr)
    self.write_attribute(attr.to_sym, nil)
    self
  end
  def self.users(key)
    self.where.not({key.to_sym => nil}).map{ |o| o.user }
  end
  def find_using_slug(param)
    slug = param.split('-').last || param
    where(slug: slug).limit(1).first
  end
  protected
    def unique_slug(key)
      loop do
        slug = SecureRandom.base64(6).tr('+/=','')
        return slug# unless self.exists?({key.to_sym => slug})
      end
    end
end
