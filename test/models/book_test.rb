require 'test_helper'

class BookTest < ActiveSupport::TestCase
  setup do
    @series = series(:one)
    @series1 = series(:two)
    Current.user = users(:one)
  end
  def valid_params(options = {})
    {
      title: 'Test Book',
      synopsis: '<p>This is a test book.</p>'
    }.merge(options)
  end
  context 'associations' do
    # should have_many(:comments)
    should belong_to(:series)
    should have_one(:bucket)
    should have_many(:authors)
    should have_rich_text(:synopsis)
    should have_rich_text(:excerpt)
    should have_one_attached(:cover)
    should have_one_attached(:hero_background)
  end
  context 'validations' do
    should validate_presence_of(:title)
    should validate_presence_of(:synopsis)
  end
  test 'new book should default to unpublished' do
    book = @series.books.create(valid_params)
    assert_not book.is_released?, book.errors.full_messages.to_s
    assert_not Book.published.include?(book), book.errors.full_messages.to_s
  end
  test 'a book with a future release date should not be released' do
    book = @series.books.create(valid_params(released_on: DateTime.now + 1.day))
    assert_not book.is_released?, book.errors.full_messages.to_s
    assert_not Book.published.include?(book), book.errors.full_messages.to_s
  end
  test 'new book should not be featured' do
    book = @series.books.create(valid_params)
    assert_not book.is_featured?, book.errors.full_messages.to_s
  end
  test 'a released book not featured should not should be featured' do
    book = @series.books.create(valid_params(released_on: DateTime.now))
    assert_not book.is_featured?, book.errors.full_messages.to_s
    assert_not Book.featured.include?(book), book.errors.full_messages.to_s
  end
  test 'a released book featured could be featured' do
    book = @series.books.create(valid_params(released_on: DateTime.now, is_featured: true))
    assert book.is_featured?, book.errors.full_messages.to_s
  end
  test 'default author should be current user' do
    book = @series.books.create(valid_params)
    assert_equal Current.user, book.users.first, book.errors.full_messages.to_s
  end
  test 'book should have wip as default status' do
    book = @series.books.create(valid_params)
    assert_equal 'wip', book.status, book.errors.full_messages.to_s
  end
  test 'title should be the string representation of the book' do
    book = @series.books.create(valid_params)
    assert_equal book.title, book.to_s, book.errors.full_messages.to_s
  end
  test 'deleted book should still be there' do
    book = @series.books.create(valid_params)
    book.destroy
    assert Book.with_deleted.where(id: book.id), book.errors.full_messages.to_s
  end
end
