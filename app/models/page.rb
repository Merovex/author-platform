class Page < ApplicationRecord
  include Sluggable
  has_rich_text :content
end
