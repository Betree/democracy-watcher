class Statistic < ActiveRecord::Base
  belongs_to  :ruling_entity

  has_many    :statistic_sources, dependent: :delete_all
  has_many    :sources, through: :statistic_sources

  enum chart_type: [:no_chart, :line, :pie, :column, :bar, :area, :scatter]

  validates :ruling_entity, presence: true

  def as_json(options = nil)
    json = super(options)
    if self.association_cached?(:sources)
      json[:sources] = self.sources
    end
    json
  end

  # Config for Rails Admin.
  rails_admin do
    field :ruling_entity
    field :description, :ck_editor
    field :sources
    field :chart_type
    field :chart_data, :code_mirror
    field :chart_options, :code_mirror
  end
end
