class Episode < ApplicationRecord
  belongs_to :book
  belongs_to :series
  before_create :set_default_episode_number

  def set_default_episode_number
    write_attribute(:order, series.episodes.count + 1)
  end
end
