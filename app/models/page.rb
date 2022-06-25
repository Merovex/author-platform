class Page < ApplicationRecord
  acts_as_paranoid
  include Sluggable
  has_rich_text :content
end
