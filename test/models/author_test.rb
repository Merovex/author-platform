# == Schema Information
#
# Table name: authors
#
#  id         :bigint           not null, primary key
#  summary    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  book_id    :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_authors_on_book_id  (book_id)
#  index_authors_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (book_id => books.id)
#  fk_rails_...  (user_id => users.id)
#
require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
  setup do
    Current.user = users(:one)
    @book = books(:one)
    @book1 = books(:two)
  end
  def valid_params(options = {})
    {}.merge(options)
  end
  test 'book deletion deletes authors, but not users' do
    @book.authors.create(user: Current.user)
    author = @book.authors.first
    @book.destroy
    assert_not Author.where(id: Current.user.id, book_id: @book.id).first, author.errors.full_messages.join(', ')
    assert User.find(Current.user.id), author.errors.full_messages.join(', ')
  end
end
