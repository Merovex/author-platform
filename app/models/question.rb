class Question < ApplicationRecord
  acts_as_paranoid
  has_many :answers, dependent: :destroy
  has_one :reminder, dependent: :destroy, as: :remindable

  include PublicActivity::Model
  tracked owner: proc { Current.user }
  def to_s
    title
  end
end
