# == Schema Information
#
# Table name: episodes
#
#  id         :bigint           not null, primary key
#  order      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  book_id    :bigint           not null
#  series_id  :bigint           not null
#
# Indexes
#
#  index_episodes_on_book_id    (book_id)
#  index_episodes_on_series_id  (series_id)
#
# Foreign Keys
#
#  fk_rails_...  (book_id => books.id)
#  fk_rails_...  (series_id => series.id)
#
class Episode < ApplicationRecord
  belongs_to :book
  belongs_to :series
  before_create :set_default_episode_number

  def set_default_episode_number
    write_attribute(:order, series.episodes.count + 1)
  end
end
