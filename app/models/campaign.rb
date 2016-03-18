class Campaign < ActiveRecord::Base
  belongs_to :political_party
  belongs_to :leader, class_name: Politician
  has_many :promises
end
