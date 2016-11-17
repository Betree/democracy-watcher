# Author::    Benjamin Piouffle
# License::   MIT

class Group < ActiveRecord::Base
  validates :name, presence: true
end
