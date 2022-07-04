require 'test_helper'

class BucketTest < ActiveSupport::TestCase
  setup do
    Current.user = users(:one)
    @book = books(:one)
    @book1 = books(:two)
  end
  def entry_params(options = {})
    {
      wrote_on: '2020-01-01',
      count: 1000
    }.merge(options)
  end
  test 'deleting book deletes buckets and entries' do
    book = @book
    bucket = book.bucket
    entries = bucket.writing_entries.create(entry_params)
    book.destroy
  end
end
