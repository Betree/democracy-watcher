# Author::    Benjamin Piouffle
# License::   MIT

class PromiseSource < ActiveRecord::Base
  has_one :promise
  has_one :source
  eager_load :source
end
