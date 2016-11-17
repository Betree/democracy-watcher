# Author::    Benjamin Piouffle
# License::   MIT

class Leader < ActiveRecord::Base
  validates :name, presence: true
end
