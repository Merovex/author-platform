class Question < ApplicationRecord
  acts_as_paranoid
  has_many :answers, dependent: :destroy
  # has_one :reminder, dependent: :destroy, as: :remindable
  has_many :memberships, dependent: :destroy, as: :membershipable

  include PublicActivity::Model
  tracked owner: proc { Current.user }
  def to_s
    title
  end
end
