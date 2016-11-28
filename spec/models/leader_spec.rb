require 'rails_helper'

describe Leader do
  it 'is valid with valid attributes' do
    expect(Leader.new(name: 'Roger')).to be_valid
  end
  it 'is not valid without a name' do
    expect(Leader.new).to_not be_valid
  end
end