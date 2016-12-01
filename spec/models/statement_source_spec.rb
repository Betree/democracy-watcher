require 'rails_helper'

RSpec.describe StatementSource, type: :model do
  it 'is valid if it has a leader and a source' do
    expect(StatementSource.new(statement: Statement.new,
                               source: Source.new)).to be_valid
  end

  describe 'when created with missing fields' do
    it 'is not valid without a source' do
      expect(StatementSource.new(statement: Statement.new)).to_not be_valid
    end

    it 'is not valid without a leader statement' do
      expect(StatementSource.new(source: Source.new)).to_not be_valid
    end
  end
end
