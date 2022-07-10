# == Schema Information
#
# Table name: series
#
#  id         :bigint           not null, primary key
#  deleted_at :datetime
#  slug       :string
#  synopsis   :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_series_on_deleted_at  (deleted_at)
#  index_series_on_slug        (slug)
#
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
