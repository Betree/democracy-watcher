class Statistic < ActiveRecord::Base
  belongs_to  :ruling_entity

  has_many    :statistic_sources, dependent: :delete_all
  has_many    :sources, through: :statistic_sources

  enum chart_type: [:line, :pie, :column, :bar, :area, :scatter]

  validates   :ruling_entity, presence: true

  # Config for Rails Admin
  rails_admin do
    configure :statistic_sources do
      hide
    end
    parent RulingEntity
  end
end
