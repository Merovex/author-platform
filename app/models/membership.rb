class Membership < ApplicationRecord
  belongs_to :user, default: -> { Current.user }
  belongs_to :membershipable, polymorphic: true
end
