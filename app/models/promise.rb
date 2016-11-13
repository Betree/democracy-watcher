# Author::    Benjamin Piouffle
# License::   MIT

class Promise < ActiveRecord::Base
  belongs_to  :ruling_party
  belongs_to  :subject, class_name: PromiseSubject
  has_many    :promise_sources
  has_many    :sources, through: :promise_sources

  enum        status:   [:not_yet_started, :in_progress, :done, :broken]

  validates   :status, presence: true
  validates   :subject, presence: true

  def self.categorized
    eager_load(:subject, :sources).all.group_by { |p| p.subject.category }
  end

  def as_json(options)
    json = super(include: :sources)
    json[:sources] = self.sources
    json
  end
end
