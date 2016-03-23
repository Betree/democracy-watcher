class RulingParty < ActiveRecord::Base
  belongs_to  :political_party
  belongs_to  :leader, class_name: Politician
  has_many    :promises

  enum rule_type: [:National, :State, :City]

  scope :for_date, -> (date) {
    where('mandate_start <= ?', date)
      .where('mandate_end >= ?', date)
  }
end
