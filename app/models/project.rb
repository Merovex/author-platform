class Project < ApplicationRecord
  belongs_to :book
  has_many :writing_entries, dependent: :destroy
  has_many :todolists, as: :todolistable
  has_many :memberships, dependent: :destroy, as: :membershipable

  include PublicActivity::Model
  tracked owner: proc { Current.user }

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
