# Populate basic data into the database

# Create default parameters
GeneralSettings.create(welcome_message:  "<h2>Welcome to DemocracyWatcher !</h2><br>
You should customize this message in the <a href='/admin/sign_in'>the admin section</a>.")

# Create default admin
if Admin.count == 0
  Admin.create!(email: 'admin@democracywatcher.com', password: 'password', password_confirmation: 'password')
end

# Add fake data for development database (useful to work on the views)
if Rails.env == 'development'
  number_of_promises = (5..50)
  number_of_sources = (0..3)
  number_of_statistics = (0..10)
  number_of_statements = (0..40)
  date_start = Date.current - 3.months
  mandate_duration = 3.years

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

  # Sources
  sources = [
    Source.create(media: 'The Best newspaper', title: "You won't believe this", url: 'qwant.com'),
    Source.create(media: 'The Best newspaper', title: 'Another article', url: 'qwant.com'),
    Source.create(media: 'Another Newspaper', title: 'Article title', url: 'qwant.com'),
    Source.create(media: 'Open Data FR', title: 'List of actions 2016', url: 'qwant.com'),
    Source.create(media: 'Youtube', title: 'She breaks her promise', url: 'qwant.com')
  ]

  # Charts
  charts = [
      {type: 'line', data: '{"12/10/1991": 42, "13/10/1991": 88, "14/10/1991": 66, "15/10/1991": 41}'},
      {type: 'pie', data: '{"Some stuff": 42, "Other stuff": 88, "Peanuts": 66}'},
      {type: 'bar', data: '{"Some stuff": 42, "Other stuff": 88, "Peanuts": 66}'},
      {type: 'column', data: '{"Some stuff": 42, "Other stuff": 88, "Peanuts": 66}'},
      {type: 'area', data: '{"Some stuff": 42, "Other stuff": 88, "Peanuts": 66}'},
  ]

  # Create entities and their promises
  entities.each do |entity, leader|
    group = Group.create(name: entity)
    leader = Leader.create(name: leader)
    # Create statements for that leader
    (0..rand(number_of_statements)).each {
      statement = Statement.create( leader: leader,
                                    statement: Forgery::LoremIpsum.sentence,
                                    status: 1,
                                    date_statement: Forgery::Date.date,
                                    description: Forgery::LoremIpsum.paragraphs(rand(1..8)))
      # Create statement sources
      (number_of_sources.first..rand(number_of_sources)).each {
        StatementSource.create(statement: statement, source: sources.sample)
      }
    }

    ruling_entity = RulingEntity.create(leader: leader, group: group, mandate_start: date_start,
                                        mandate_end: date_start + mandate_duration,
                                        description: Forgery(:lorem_ipsum).paragraphs(rand(1..4)))

    # Create promises
    for i in (number_of_promises.first..rand(number_of_promises))
      promise = Promise.create(ruling_entity: ruling_entity, subject: promise_subjects.sample,
                               status: promise_status.sample, title: promises.sample,
                               description: Forgery(:lorem_ipsum).paragraphs(rand(1..8)))

      # Create promises sources
      for j in (number_of_sources.first..rand(number_of_sources))
        PromiseSource.create(promise: promise, source: sources.sample)
      end
    end

    # Create statistics
    for i in (number_of_statistics.first..rand(number_of_statistics))
      chart = charts.sample
      statistic = Statistic.create( ruling_entity: ruling_entity,
                                    description: Forgery(:lorem_ipsum).paragraphs(rand(0..1)),
                                    chart_type: chart[:type], chart_data: chart[:data])
      # Create statistics sources
      for j in (number_of_sources.first..rand(number_of_sources))
        StatisticSource.create(statistic: statistic, source: sources.sample)
      end
    end
    date_start -= mandate_duration
  end

end