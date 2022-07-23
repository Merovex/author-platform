# == Schema Information
#
# Table name: binder_items
#
#  id         :bigint           not null, primary key
#  ancestry   :string
#  name       :string
#  synopsis   :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :bigint           not null
#
# Indexes
#
#  index_binder_items_on_ancestry    (ancestry)
#  index_binder_items_on_project_id  (project_id)
#
# Foreign Keys
#
#  fk_rails_...  (project_id => projects.id)
#
require "test_helper"

class BinderItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
