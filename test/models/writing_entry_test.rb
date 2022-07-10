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
require 'test_helper'

class WritingEntryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
