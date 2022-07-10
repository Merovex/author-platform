# == Schema Information
#
# Table name: clicks
#
#  id             :bigint           not null, primary key
#  city           :string
#  clickable_type :string
#  country        :string
#  country_code   :string
#  ip             :string
#  latitude       :float
#  longitude      :float
#  map            :string
#  state          :string
#  state_code     :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  clickable_id   :integer
#  user_id        :bigint
#
# Indexes
#
#  index_clicks_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Click < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :clickable, polymorphic: true, optional: true

  # We only hold the IP long enough to determine the location in batch.
  def locate(locx)
    self.state = locx.region
    self.city = locx.city
    self.country = locx.country
    self.latitude = locx.latitude
    self.longitude = locx.longitude
    self.country_code = locx.country_code
  end

  def locate!(locx)
    locate(locx)
    save
  end
end
