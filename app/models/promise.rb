class Promise < ActiveRecord::Base
  belongs_to :campaign
  has_many :promise_statuses
  enum category: [:Culture, :Economy, :Environment, :Government, :Immigration, :Security]
  validates :category, presence: true
end
