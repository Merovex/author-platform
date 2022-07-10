# == Schema Information
#
# Table name: answers
#
#  id          :bigint           not null, primary key
#  deleted_at  :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :bigint           not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_answers_on_question_id  (question_id)
#  index_answers_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (question_id => questions.id)
#  fk_rails_...  (user_id => users.id)
#
class Answer < ApplicationRecord
  # acts_as_paranoid
  belongs_to :user
  belongs_to :question
  has_rich_text :content

  acts_as_notifiable :users,
    # Notification targets as :targets is a necessary option
    # Set to notify to author and users commented to the article, except comment owner self
    targets: ->(answer) { [answer.user, answer.question.user] },
    notifier: Current.user

  def to_s
    question.title
  end
end
