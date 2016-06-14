# Author::    Benjamin Piouffle
# License::   MIT
#
# Defines a party ruling on a city, a state or an entire country

class RulingParty < ActiveRecord::Base
  belongs_to  :political_party
  belongs_to  :leader, class_name: Politician
  has_many    :promises, :dependent => :delete_all

  enum rule_type: [:national, :state, :city]

  mount_uploader :banner, RulingPartyBannerUploader

  # Get the ruling party for a given +date+
  def self.for_date (date)
    where('mandate_start <= ?', date).where('mandate_end >= ?', date)
  end

  def is_current
    Date.current.between? mandate_start, mandate_end
  end

  # Returns the total number of days mandate is set up for / lasted
  def total_mandate_duration
    # The condition allows us to say rule stayed for 1 day even if mandate_start and mandate_end are the same
    mandate_end - mandate_start > 0 ? (mandate_end - mandate_start).to_i : 1
  end

  def name
    return I18n.t('party_description', party=political_party, leader=leader) if political_party and leader
    return political_party.name if political_party
    return leader.name if leader
    id.to_s
  end
end
