class WritingGoal < ApplicationRecord
  belongs_to :book
  has_many :writing_entries
  
  include Slug, Sluggable

  def to_param
    slug
  end
  # module ClassMethods
  #   def find_using_slug(param)
  #     slug = param.split('-').last || param
  #     where(slug: slug).limit(1).first
  #   end
  # end
end
