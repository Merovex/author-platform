class Answer < ApplicationRecord
  acts_as_paranoid
  belongs_to :user
  belongs_to :question
  has_rich_text :content

  include PublicActivity::Model
  tracked owner: Proc.new{ Current.user }
end
