# == Schema Information
#
# Table name: bookstores
#
#  id         :bigint           not null, primary key
#  key        :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Bookstore < ApplicationRecord
  def to_s
    name
  end
end
