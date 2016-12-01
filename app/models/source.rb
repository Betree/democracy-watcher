# Author::    Benjamin Piouffle
# License::   MIT

class Source < ActiveRecord::Base
  validates :url, presence: true, if: 'media.to_s.empty? and title.to_s.empty?'
  validates :media, presence: true, if: 'url.to_s.empty? and title.to_s.empty?'
  validates :title, presence: true, if: 'url.to_s.empty? and media.to_s.empty?'

  def name
    if media and title
      return "#{media} - #{title}"
    end

    title or media or url
  end
end
