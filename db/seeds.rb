# Populate basic data into the database

# Add fake data for development database (useful to work on the views)
if Rails.env == 'development'
  party = PoliticalParty.create(name: 'Silly party')
  politician = Politician.create(name: 'Jethro Q. Walrustitty')
  ruling_party = RulingParty.create(leader: politician, political_party: party, rule_type: 'national', mandate_start: Date.current - 3.months, mandate_end: Date.current + 3.years)
  promise_group_edu_1 = PromiseSubject.create(category: 'education', title: 'A nice subject')
  promise_group_edu_2 = PromiseSubject.create(category: 'education', title: 'Another subject')
  promise_group_culture = PromiseSubject.create(category: 'culture')
  promise_group_economy = PromiseSubject.create(category: 'economy')
  promise_group_security = PromiseSubject.create(category: 'economy')
  promise_group_environment = PromiseSubject.create(category: 'environment')
  promise_group_immigration = PromiseSubject.create(category: 'immigration')

  Promise.create(ruling_party: ruling_party, subject: promise_group_edu_1, status: 'not_yet_started', title: 'Educate dat godamn children !', description: 'A pretty nice description')
  Promise.create(ruling_party: ruling_party, subject: promise_group_economy, status: 'not_yet_started', title: 'Do the stuff', description: 'A pretty nice description')
  Promise.create(ruling_party: ruling_party, subject: promise_group_culture, status: 'done', title: 'Free pancakes for the poor', description: 'A pretty nice description')
  Promise.create(ruling_party: ruling_party, subject: promise_group_security, status: 'done', title: 'Legalize blue doors', description: 'A pretty nice description')
  Promise.create(ruling_party: ruling_party, subject: promise_group_edu_2, status: 'done', title: 'Educate dat godamn chicken !', description: 'A pretty nice description')
  Promise.create(ruling_party: ruling_party, subject: promise_group_environment, status: 'broken', title: 'Go to mars', description: 'A pretty nice description')
  Promise.create(ruling_party: ruling_party, subject: promise_group_immigration, status: 'broken', title: 'What is love ? To dodo to dodo to do do do todo do dodo dodo', description: 'What is love ? A pretty nice description')
end