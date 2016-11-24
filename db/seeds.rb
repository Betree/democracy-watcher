# Populate basic data into the database

# Add fake data for development database (useful to work on the views)
if Rails.env == 'development'
  number_of_promises = (5..50)
  date_start = Date.current - 3.months
  mandate_duration = 3.years

  Admin.create!(email: 'admin@democracywatcher.com', password: 'password', password_confirmation: 'password')

  # Defines entities / leaders
  entities = {
    'Silly Party': 'Jethro Q. Walrustitty',
    'Chickens Party': 'Chicko',
    "Bird's league": 'Birdy',
    'Medieval Backpack': 'Mike Chocolate',
    'Risky  Toothbrush  Inequality': 'John John',
    'Next  Proton  Sanction': 'Alt John',
    'Empty  Soybean  Five': 'Long John',
    'Sinister  Revival': 'Other John',
    'Flagpole  Burial': 'John Again'
  }

  # Some promises
  promises = [
      'Educate dat godamn chicken !',
      'Do the stuff',
      'Free books for the poor',
      'Legalize blue doors',
      'Teach all students about happiness',
      'Go to mars',
      'What is love ? To to dodo to dodo dodo to dodo to do do'
  ]

  # Promises subjects
  promise_subjects = [
    PromiseSubject.create(category: 'education', title: 'A nice subject'),
    PromiseSubject.create(category: 'education', title: 'Another subject'),
    PromiseSubject.create(category: 'culture'),
    PromiseSubject.create(category: 'economy'),
    PromiseSubject.create(category: 'security'),
    PromiseSubject.create(category: 'environment'),
    PromiseSubject.create(category: 'immigration')
  ]

  # Promises status
  promise_status = [:not_yet_started, :in_progress, :done, :broken]

  # Create entities and their promises
  entities.each do |entity, leader|
    group = Group.create(name: entity)
    leader = Leader.create(name: leader)
    ruling_entity = RulingEntity.create(leader: leader, group: group, mandate_start: date_start,
                                     mandate_end: date_start + mandate_duration)

    for i in (0..rand(number_of_promises))
      Promise.create(ruling_entity: ruling_entity, subject: promise_subjects.sample, status: promise_status.sample,
                     title: promises.sample, description: LoremIpsum.random(paragraphs: rand(1..8)))
    end

    date_start -= mandate_duration
  end

end