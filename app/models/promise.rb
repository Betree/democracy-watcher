class Promise < ActiveRecord::Base
  belongs_to  :ruling_party
  has_many    :promise_statuses

  enum        category: [:Culture, :Economy, :Environment, :Government, :Immigration, :Security, :Education]

  validates   :category, presence: true
end
