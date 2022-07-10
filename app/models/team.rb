# == Schema Information
#
# Table name: teams
#
#  id          :bigint           not null, primary key
#  deleted_at  :datetime
#  description :text
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_teams_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Team < ApplicationRecord
  belongs_to :user, default: -> { Current.user }
  include Communicable, Todolistable

  def to_s
    name
  end
end
