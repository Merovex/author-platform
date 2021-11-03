class Subscription < ApplicationRecord
  belongs_to :user
  include Slug

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
  protected
    def unique_slug(key)
      loop do
        slug = SecureRandom.base64(6).tr('+/=','')
        return slug# unless self.exists?({key.to_sym => slug})
      end
    end
end