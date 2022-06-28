class Series < ApplicationRecord
  acts_as_paranoid
  include Sluggable
  include Slug

  include PublicActivity::Model
  tracked owner: Proc.new{ Current.user }
  # has_many :episodes
  has_many :books # , through: :episodes
end
