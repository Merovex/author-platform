# == Schema Information
#
# Table name: praises
#
#  id         :bigint           not null, primary key
#  deleted_at :datetime
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  book_id    :bigint           not null
#
# Indexes
#
#  index_praises_on_book_id     (book_id)
#  index_praises_on_deleted_at  (deleted_at)
#
# Foreign Keys
#
#  fk_rails_...  (book_id => books.id)
#
class Praise < ApplicationRecord
  acts_as_paranoid
  acts_as_list scope: :book

  belongs_to :book
  has_rich_text :comment
  validates :comment, presence: true

  include PublicActivity::Model
  tracked owner: proc { Current.user }
end
