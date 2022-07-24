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
#  binder_id  :bigint           not null
#
# Indexes
#
#  index_binder_items_on_ancestry   (ancestry)
#  index_binder_items_on_binder_id  (binder_id)
#
# Foreign Keys
#
#  fk_rails_...  (binder_id => binders.id)
#
class BinderItem < ApplicationRecord
  belongs_to :binder
  has_rich_text :content
  has_many_attached :images
  has_ancestry

  validates :name, presence: true
end
