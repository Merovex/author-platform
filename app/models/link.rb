# == Schema Information
#
# Table name: links
#
#  id            :bigint           not null, primary key
#  clicked       :integer          default(0)
#  comment       :text
#  css           :string
#  deleted_at    :datetime
#  linkable_type :string
#  slug          :string
#  url           :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  linkable_id   :integer
#
# Indexes
#
#  index_links_on_deleted_at  (deleted_at)
#
class Link < ApplicationRecord
  acts_as_paranoid
  validates :url, presence: true, uniqueness: true
  validates :url, format: URI::DEFAULT_PARSER.make_regexp(%w[http https])
  # validates :slug, presence: true, uniqueness: true
  include Slug
  # attribute :slug, :string, default: lambda {
  #   loop do
  #     slug = SecureRandom.uuid.split('-').first
  #     return slug unless exists?(slug: slug)
  #   end
  # }
  belongs_to :linkable, polymorphic: true, optional: true
  acts_as_taggable_on :tags

  def short
    Rails.application.routes.url_helpers.short_url(slug:, only_path: true)
  end

  def to_param
    slug
  end
end
