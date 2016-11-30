require 'rails_helper'

RSpec.describe LeaderStatement, type: :model do
  it 'is valid when all params are given' do
    expect(LeaderStatement.new( leader: Leader.new,
                                statement: Forgery::LoremIpsum.sentence,
                                status: 1,
                                date_statement: Forgery::Date.date,
                                description: Forgery::LoremIpsum.paragraphs(5)
    )).to be_valid
  end

  it 'is valid even if date and description are missing' do
    expect(LeaderStatement.new( leader: Leader.new,
                                statement: Forgery::LoremIpsum.sentence,
                                status: 1
    )).to be_valid
  end

  it 'is not valid if leader, statement or status are missing' do
    expect(LeaderStatement.new(statement: Forgery::LoremIpsum.sentence, status: 1)).to_not be_valid

    expect(LeaderStatement.new(leader: Leader.new, status: 1)).to_not be_valid

    expect(LeaderStatement.new(statement: Forgery::LoremIpsum.sentence, leader: Leader.new)
    ).to_not be_valid
  end

  it 'is not valid if date is not a valid date'
end
