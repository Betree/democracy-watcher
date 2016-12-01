class StatementSource < ApplicationRecord
  belongs_to :statement
  belongs_to :source

  validates   :statement, presence: true
  validates   :source, presence: true
end
