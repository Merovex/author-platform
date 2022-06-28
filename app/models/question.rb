class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  include PublicActivity::Model
  tracked owner: Proc.new{ Current.user }
  def to_s
    title
  end
end
