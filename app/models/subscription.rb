class Subscription < ApplicationRecord
  belongs_to :user
  include Sluggable
  
end
