require 'test_helper'

class BookTest < ActiveSupport::TestCase
  setup do
    @series = series(:one)
    Current.user = users(:one)
  end
  def valid_params(options = {})
    { 
      title: "Test Book",
      synopsis: "<div>This is a test book.</div>",
    }.merge(options)
  end

  test "should not save book without title" do
    book = @series.books.create()
    assert_not book.save, book.errors.full_messages.to_s
  end
  test "should save book with title" do
    book = @series.books.create(valid_params)
    assert book.save, book.errors.full_messages.to_s
  end
  test "should not save book without series" do
    book = Book.new(valid_params)
    assert_not book.save, book.errors.full_messages.to_s
  end
  test "series should be parent of book" do
    book = @series.books.create(valid_params)
    book.save
    assert_equal @series, book.series, book.errors.full_messages.to_s
  end
  test 'book should have synopsis' do
    p = valid_params
    p.delete(:synopsis)
    book = @series.books.create(p)
    assert_not book.save, book.errors.full_messages.to_s
  end
  test 'book should not save without synopsis' do
    p = valid_params
    p.delete(:synopsis)
    book = @series.books.create(p)
    assert_not book.save, book.errors.full_messages.to_s
  end
  test 'new book should default to unpublished' do
    book = @series.books.create(valid_params)
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
  test 'a book with a future release date should not be released' do
    book = @series.books.create(valid_params(released_on: DateTime.now + 1.day))
    assert_not book.is_released?, book.errors.full_messages.to_s
    assert_not Book.published.include?(book), book.errors.full_messages.to_s
  end

  test 'a released book featured could be featured' do
    book = @series.books.create(valid_params(released_on: DateTime.now, is_featured: true))
    assert book.is_featured?, book.errors.full_messages.to_s
  end
  test 'a new book should have a bucket assigned' do
    book = @series.books.create(valid_params)
    assert_not book.bucket.nil?, book.errors.full_messages.to_s
  end
  test 'a new book should have at least one author' do
    book = @series.books.create(valid_params)
    assert_not book.authors.empty?, book.errors.full_messages.to_s
  end
  test 'default author should be current user' do
    book = @series.books.create(valid_params)
    assert_equal Current.user, book.users.first, book.errors.full_messages.to_s
  end
  test 'book should have a default position' do
    book = @series.books.create(valid_params)
    assert_not book.position.nil?, book.errors.full_messages.to_s
  end
  test 'book should not have same position as another book' do
    book = @series.books.create(valid_params)
    book2 = @series.books.create(valid_params)
    assert_not book.position == book2.position, book.errors.full_messages.to_s
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
