class RulingParty < ActiveRecord::Base
  belongs_to :campaign
  delegate :political_party, :leader, to: :campaign

  scope :for_date, -> (date) {
    where('mandate_start <= ?', date)
      .where('mandate_end >= ?', date)
  }
end
