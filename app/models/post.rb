class Post < ApplicationRecord
  belongs_to :user
  has_rich_text :content

  include Sluggable
end
