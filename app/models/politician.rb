# Author::    Benjamin Piouffle
# License::   MIT

class Politician < ActiveRecord::Base
  validates :name, presence: true
end
