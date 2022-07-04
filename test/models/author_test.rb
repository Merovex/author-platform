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
