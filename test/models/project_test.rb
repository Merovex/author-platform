# == Schema Information
#
# Table name: projects
#
#  id         :bigint           not null, primary key
#  finish_on  :date
#  start_on   :date
#  summary    :text
#  target     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  book_id    :bigint           not null
#
# Indexes
#
#  index_projects_on_book_id  (book_id)
#
# Foreign Keys
#
#  fk_rails_...  (book_id => books.id)
#
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
