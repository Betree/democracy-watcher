require 'rails_helper'

describe GeneralSettings do
  it 'should be only one entry' do
    expect(GeneralSettings.create).to be_valid
    expect(GeneralSettings.create).to_not be_valid
  end
end