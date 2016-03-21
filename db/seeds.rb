# Populate basic data into the database

# Add fake data for development database (useful to work on the views)
if Rails.env == 'development'
  party = PoliticalParty.create(name: 'Silly party')
  politician = Politician.create(name: 'Jethro Q. Walrustitty')
  campaign = Campaign.create(vote_date: Date.current - 1.year, political_party_id: party.id, leader_id: politician.id)
  RulingParty.create(campaign: campaign, mandate_start: Date.current - 3.months, mandate_end: Date.current + 3.years)
end