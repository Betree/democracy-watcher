# Author::    Benjamin Piouffle
# License::   MIT

class Source < ActiveRecord::Base
  belongs_to :promise
  enum source_type: [:Promise, :Status]
end
