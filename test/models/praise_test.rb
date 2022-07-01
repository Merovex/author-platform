require 'test_helper'

class PraiseTest < ActiveSupport::TestCase
  setup do
    Current.user = users(:one)
    @book = books(:one)
    @book1 = books(:two)
  end
  def valid_params(options = {})
    {
      comment: "<div>This is a test book.</div>",
    }.merge(options)
  end
  test "praise must have comment" do
    praise = @book.praises.new(valid_params(comment: nil))
    assert_not praise.save, praise.errors.full_messages.join(', ')
  end
  test "praise should have book as parent" do
    praise = Praise.new
    assert_not praise.save, praise.errors.full_messages.join(', ')
    praise = @book.praises.new(valid_params)
    assert praise.save, praise.errors.full_messages.join(', ')
  end
  test "praise should have position" do
    praise = @book.praises.new(valid_params)
    assert praise.save, praise.errors.full_messages.join(', ')
    assert praise.position, praise.errors.full_messages.join(', ')
  end
  test "praise position should be scoped to book" do
    praise = @book.praises.create(valid_params)
    praise1 = @book1.praises.create(valid_params)
    assert (praise.position == praise1.position), praise.errors.full_messages.join(', ')
  end
  test "deleted praise should not be in list" do
    praise = @book.praises.create(valid_params)
    praise.destroy
    assert_not @book.praises.where(id: praise.id).first, praise.errors.full_messages.join(', ')
  end
  test "deleted praise should be soft deleted" do
    praise = @book.praises.create(valid_params)
    praise.destroy
    assert Praise.with_deleted.where(id: praise.id), praise.errors.full_messages.to_s
  end
end
