class Promise < ActiveRecord::Base
  belongs_to :campaign
  has_many :promise_statuses
end
