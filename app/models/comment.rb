class Comment < ApplicationRecord
  belongs_to :user, default: -> { Current.user }
  has_rich_text :content
  belongs_to :commentable, polymorphic: true # , optional: true

  include PublicActivity::Model
  tracked owner: Proc.new{ Current.user }
end
