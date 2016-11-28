require 'rails_helper'

describe Group do
  it 'is valid with valid attributes' do
    expect(Group.new(name: 'The Incredibles')).to be_valid
  end
  it 'is not valid without a name' do
    expect(Group.new).to_not be_valid
  end
end