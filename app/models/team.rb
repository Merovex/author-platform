class Team < ApplicationRecord
  belongs_to :user, default: -> { Current.user }
  include Communicable, Todolistable

  def to_s
    name
  end
end
