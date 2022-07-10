# == Schema Information
#
# Table name: questions
#
#  id         :bigint           not null, primary key
#  deleted_at :datetime
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Question < ApplicationRecord
  acts_as_paranoid
  has_many :answers, dependent: :destroy
  has_one :reminder, dependent: :destroy, as: :remindable
  include Communicable

  include PublicActivity::Model
  tracked owner: proc { Current.user }
  def to_s
    "HERE"
  end
end
