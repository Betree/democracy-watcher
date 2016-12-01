# Author::    Benjamin Piouffle
# License::   MIT

class Source < ActiveRecord::Base
  def name
    if media and title
      return "#{media} - #{title}"
    end

    title or media or url
  end
end
