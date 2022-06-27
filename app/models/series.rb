class Series < ApplicationRecord
  acts_as_paranoid
  include Sluggable
  include Slug

  # has_many :episodes
  has_many :books # , through: :episodes
end
