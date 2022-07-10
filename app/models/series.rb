class Series < ApplicationRecord
  acts_as_paranoid
  include Sluggable
  include Slug

  include PublicActivity::Model
  tracked owner: proc { Current.user }
  # has_many :episodes
  has_many :books # , through: :episodes
  def to_s
    title
  end
end
