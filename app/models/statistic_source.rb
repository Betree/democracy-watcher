class StatisticSource < ApplicationRecord
  belongs_to :statistic
  belongs_to :source

  validates   :statistic, presence: true
  validates   :source, presence: true
end
