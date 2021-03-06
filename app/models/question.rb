# == Schema Information
#
# Table name: questions
#
#  id         :bigint           not null, primary key
#  deleted_at :datetime
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_questions_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Question < ApplicationRecord
  acts_as_paranoid
  has_many :answers, dependent: :destroy
  has_one :reminder, dependent: :destroy, as: :remindable
  belongs_to :user, default: -> { Current.user }
  include Communicable
  accepts_nested_attributes_for :reminder

  def to_s
    title
  end
end
