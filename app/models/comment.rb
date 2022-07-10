# == Schema Information
#
# Table name: comments
#
#  id               :bigint           not null, primary key
#  commentable_type :string
#  deleted_at       :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  commentable_id   :bigint
#  user_id          :bigint           not null
#
# Indexes
#
#  index_comments_on_commentable  (commentable_type,commentable_id)
#  index_comments_on_user_id      (user_id)
#  index_on_commentable           (commentable_id,commentable_type)
#  index_on_commentable_and_user  (commentable_id,commentable_type,user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Comment < ApplicationRecord
  belongs_to :user, default: -> { Current.user }
  has_rich_text :content
  belongs_to :commentable, polymorphic: true # , optional: true
  validates_presence_of :user

  include PublicActivity::Model
  tracked owner: proc { Current.user }
end
