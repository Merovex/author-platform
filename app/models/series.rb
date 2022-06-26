class Series < ApplicationRecord
  acts_as_paranoid
  include Slug, Sluggable
  
  # has_many :episodes
  has_many :books#, through: :episodes
end
