class LeaderStatementSource < ApplicationRecord
  belongs_to :leader_statement
  belongs_to :source

  validates   :leader_statement, presence: true
  validates   :source, presence: true
end
