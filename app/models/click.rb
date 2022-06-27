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
