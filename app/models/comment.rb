class Comment < ApplicationRecord
  belongs_to :user, default: -> { Current.user }
  has_rich_text :content
end
