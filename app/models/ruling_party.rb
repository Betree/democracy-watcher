# Author::    Benjamin Piouffle
# License::   MIT
#
# Defines a party ruling on a city, a state or an entire country

class RulingParty < ActiveRecord::Base
  belongs_to  :political_party
  belongs_to  :leader, class_name: Politician
  has_many    :promises, :dependent => :delete_all

  eager_load [:leader, :political_party]

  enum rule_type: [:national, :state, :city]

  mount_uploader :banner, RulingPartyBannerUploader

  # Get the ruling party for a given +date+
  def self.for_date (date)
    where('mandate_start <= ?', date).where('mandate_end >= ?', date)
  end

  def is_current
    Date.current.between? mandate_start, mandate_end
  end

  # Generate the best name we can using leader and party names
  def name
    if self.political_party and self.leader
      I18n.t('party_description', party: self.political_party.name, leader: self.leader.name)
    elsif self.political_party
      self.political_party.name
    elsif self.leader
      self.leader.name
    else
      self.id.to_s
    end
  end

  # Overrides default as_json to always includes political_party, leader and generated name in details
  def as_json(options)
    json = super(:include => [:political_party, :leader])
    json[:name] = self.name
    json[:is_current] = self.is_current
    json
  end
end
