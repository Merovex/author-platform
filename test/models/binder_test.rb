# == Schema Information
#
# Table name: binders
#
#  id         :bigint           not null, primary key
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :bigint           not null
#
# Indexes
#
#  index_binders_on_project_id  (project_id)
#
# Foreign Keys
#
#  fk_rails_...  (project_id => projects.id)
#
require "test_helper"

class BinderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
