# Populate basic data into the database

# Add fake data for development database (useful to work on the views)
if Rails.env == 'development'
  Admin.create!(email: 'admin@democracywatcher.com', password: 'password', password_confirmation: 'password')

  party = PoliticalParty.create(name: 'Silly party')
  politician = Politician.create(name: 'Jethro Q. Walrustitty')
  ruling_party = RulingParty.create(leader: politician, political_party: party, rule_type: 'national', mandate_start: Date.current - 3.months, mandate_end: Date.current + 3.years)
  promise_group_edu_1 = PromiseSubject.create(category: 'education', title: 'A nice subject')
  promise_group_edu_2 = PromiseSubject.create(category: 'education', title: 'Another subject')
  promise_group_culture = PromiseSubject.create(category: 'culture')
  promise_group_economy = PromiseSubject.create(category: 'economy')
  promise_group_security = PromiseSubject.create(category: 'security')
  promise_group_environment = PromiseSubject.create(category: 'environment')
  promise_group_immigration = PromiseSubject.create(category: 'immigration')

  Promise.create(ruling_party: ruling_party, subject: promise_group_edu_1, status: 'not_yet_started', title: 'Educate dat godamn chicken !', description: 'A pretty nice description')
  Promise.create(ruling_party: ruling_party, subject: promise_group_economy, status: 'not_yet_started', title: 'Do the stuff', description: 'A pretty nice description')
  Promise.create(ruling_party: ruling_party, subject: promise_group_culture, status: 'done', title: 'Free books for the poor', description: 'A pretty nice description')
  Promise.create(ruling_party: ruling_party, subject: promise_group_security, status: 'in_progress', title: 'Legalize blue doors', description: 'A pretty nice description')
  Promise.create(ruling_party: ruling_party, subject: promise_group_edu_2, status: 'done', title: 'Teach all students about happiness', description: 'A pretty nice description')
  Promise.create(ruling_party: ruling_party, subject: promise_group_environment, status: 'broken', title: 'Go to mars', description: 'A pretty nice description')
  Promise.create(ruling_party: ruling_party, subject: promise_group_immigration, status: 'broken', title: 'What is love ? To to dodo to dodo dodo to dodo to do do', description: 'What is love ? A pretty nice description')
end