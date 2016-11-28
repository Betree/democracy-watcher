require 'rails_helper'

describe PromiseSource do
  it 'is not valid without all arguments' do
    expect(PromiseSource.new).to_not be_valid
  end
end