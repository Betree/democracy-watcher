# Author::    Benjamin Piouffle
# License::   MIT
#
# Defines a party ruling on a city, a state or an entire country

class RulingParty < ActiveRecord::Base
  belongs_to  :political_party
  belongs_to  :leader, class_name: Politician
  has_many    :promises

  enum rule_type: [:national, :state, :city]

  # Get the ruling party for a given +date+
  def self.for_date (date)
    where('mandate_start <= ?', date).where('mandate_end >= ?', date)
  end
end
