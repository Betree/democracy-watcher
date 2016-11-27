# Author::    Benjamin Piouffle
# License::   MIT

class Source < ActiveRecord::Base
  def name
    "#{media} - #{title}"
  end
end
