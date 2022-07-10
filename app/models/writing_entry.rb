# == Schema Information
#
# Table name: writing_entries
#
#  id         :bigint           not null, primary key
#  comment    :string
#  count      :integer
#  wrote_on   :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :bigint           not null
#
# Indexes
#
#  index_writing_entries_on_project_id  (project_id)
#  index_writing_entries_on_wrote_on    (wrote_on)
#
# Foreign Keys
#
#  fk_rails_...  (project_id => projects.id)
#
class WritingEntry < ApplicationRecord
  belongs_to :project

  def self.annual_wordcount(year)
    jan_1 = Date.new(year.to_i, 1, 1)
    dec_31 = Date.new(year.to_i, 12, 31)
    where(wrote_on: jan_1..dec_31).map(&:count).inject(0, :+)
  end
end
