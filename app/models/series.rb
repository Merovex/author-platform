class Series < ApplicationRecord
  include Sluggable
  has_many :episodes
  has_many :books, through: :episodes
end
