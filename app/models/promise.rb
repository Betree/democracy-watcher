# Author::    Benjamin Piouffle
# License::   MIT

class Promise < ActiveRecord::Base
  belongs_to  :ruling_entity
  belongs_to  :subject, class_name: PromiseSubject
  has_many    :promise_sources
  has_many    :sources, through: :promise_sources

  enum        status:   [:not_yet_started, :in_progress, :done, :broken]

  validates   :title, presence: true
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

  rails_admin do
    field :ruling_entity
    field :title
    field :subject
    field :status  do
      pretty_value do
        I18n.t("activerecord.models.promise.status.#{value}")
      end
    end
    field :description, :ck_editor
    field :sources
  end
end
