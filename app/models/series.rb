class Series < ApplicationRecord
  include Slug, Sluggable
  
  has_many :episodes
  has_many :books, through: :episodes
end
