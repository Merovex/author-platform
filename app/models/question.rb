class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_one :reminder, dependent: :destroy, as: :remindable
  
  include PublicActivity::Model
  tracked owner: Proc.new{ Current.user }
  def to_s
    title
  end
end
