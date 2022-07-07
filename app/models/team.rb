class Team < ApplicationRecord
  belongs_to :user, default: -> { Current.user }
  include Communicable

  def to_s
    name
  end
end
