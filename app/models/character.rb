# == Schema Information
#
# Table name: characters
#
#  id         :bigint           not null, primary key
#  name       :string
#  summary    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Character < ApplicationRecord
end
