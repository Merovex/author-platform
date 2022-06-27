class Question < ApplicationRecord
  has_many :answers, dependent: :destroy

  def to_s
    title
  end
end
