# == Schema Information
#
# Table name: pages
#
#  id         :bigint           not null, primary key
#  deleted_at :datetime
#  slug       :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_pages_on_deleted_at  (deleted_at)
#
class Page < ApplicationRecord
  acts_as_paranoid
  include Sluggable
  has_rich_text :content
end
