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

  # Some promises and their descriptions
  promises = [
      {title: 'Educate dat godamn chicken !', description: 'A pretty nice description'},
      {title: 'Do the stuff', description: 'A pretty nice description'},
      {title: 'Free books for the poor', description: 'A pretty nice description'},
      {title: 'Legalize blue doors', description: 'A pretty nice description'},
      {title: 'Teach all students about happiness', description: 'A pretty nice description'},
      {title: 'Go to mars', description: 'A pretty nice description'},
      {title: 'What is love ? To to dodo to dodo dodo to dodo to do do', description: 'What is love ? A pretty nice description'}
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
      promise_data = promises.sample
      Promise.create(ruling_entity: ruling_entity, subject: promise_subjects.sample, status: promise_status.sample,
                     title: promise_data[:title], description: promise_data[:description])
    end

    date_start -= mandate_duration
  end

end