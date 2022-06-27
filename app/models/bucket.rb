class Bucket < ApplicationRecord
  belongs_to :book
  has_many :writing_entries
  has_many :todolists, as: :todolistable

  include Sluggable
  include Slug

  def to_s
    book.title
  end

  def to_param
    slug
  end

  def days_written
    writing_entries.count
  end

  def wordcount
    writing_entries.map(&:count).inject(0, :+)
  end

  def days_remaining
    return 0 if finish_on.nil?

    (finish_on - Date.today).to_i
  end

  module ClassMethods
    def find_using_slug(slug)
      where(slug:).limit(1).first
    end
  end
end
