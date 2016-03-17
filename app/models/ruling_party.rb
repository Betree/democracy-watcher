class RulingParty < ActiveRecord::Base
  belongs_to :political_party
  belongs_to :leader, class_name: Politician
end
