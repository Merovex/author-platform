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
class Project < ApplicationRecord
  belongs_to :book
  has_many :writing_entries, dependent: :destroy
  # has_many :todolists, as: :todolistable
  include Communicable, Todolistable

  def to_s
    book.title
  end

  def days_written
    writing_entries.count
  end

  def wordcount
    writing_entries.map(&:count).inject(0, :+)
  end

  def days_remaining
    return 0 if finish_on.nil?

    (finish_on - Date.today).to_i
  end
end
