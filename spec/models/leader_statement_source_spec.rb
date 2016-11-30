require 'rails_helper'

RSpec.describe LeaderStatementSource, type: :model do
  it 'is valid if it has a leader and a source' do
    expect(LeaderStatementSource.new( leader_statement: LeaderStatement.new,
                                      source: Source.new)).to be_valid
  end

  describe 'when created with missing fields' do
    it 'is not valid without a source' do
      expect(LeaderStatementSource.new(leader_statement: LeaderStatement.new)).to_not be_valid
    end

    it 'is not valid without a leader statement' do
      expect(LeaderStatementSource.new(source: Source.new)).to_not be_valid
    end
  end
end
