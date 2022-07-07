class Team < ApplicationRecord
  belongs_to :user, default: -> { Current.user }
  has_many :memberships, dependent: :destroy, as: :membershipable
  has_many :members, through: :memberships, source: :user, dependent: :destroy
  after_create :create_membership
  def to_s
    name
  end
  def create_membership
    m = memberships.create(user_id: Current.user.id)
    puts m.inspect
    m.save
    puts m.inspect
  end
end
