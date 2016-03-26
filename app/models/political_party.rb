# Author::    Benjamin Piouffle
# License::   MIT

class PoliticalParty < ActiveRecord::Base
  validates :name, presence: true
end
