# Author::    Benjamin Piouffle
# License::   MIT

class PromiseSource < ActiveRecord::Base
  belongs_to :promise
  belongs_to :source

  validates   :promise, presence: true
  validates   :source, presence: true
end
