class WritingEntry < ApplicationRecord
  belongs_to :project

  def self.annual_wordcount(year)
    jan_1 = Date.new(year.to_i, 1, 1)
    dec_31 = Date.new(year.to_i, 12, 31)
    where(wrote_on: jan_1..dec_31).map(&:count).inject(0, :+)
  end
end
