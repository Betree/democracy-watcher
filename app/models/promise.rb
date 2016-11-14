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

  def as_json(options)
    json = super()

    if self.association_cached?(:sources)
      json[:sources] = self.sources
    end

    if self.association_cached?(:subject)
      json[:subject] = self.subject
    end

    json
  end
end
