class PoliticalParty < ActiveRecord::Base
  has_many :campaigns
end
