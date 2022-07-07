require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
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
  test 'deleting book deletes projects and entries' do
    book = @book
    project = book.project
    entries = project.writing_entries.create(entry_params)
    book.destroy
  end
end
