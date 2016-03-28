require 'test_helper'

class PoliticalPartyTest < ActiveSupport::TestCase
  test 'Political party should always have a name and it should not be empty' do
    assert_not  PoliticalParty.create(name: nil).valid?, 'Should not be created with an nil name'
    assert_not  PoliticalParty.create(name: '').valid?, 'Should not be created with an empty name'
    assert_not  PoliticalParty.create(name: ' ').valid?, 'Should not be created with only spaces for the name'
    assert      PoliticalParty.create(name: 'A decent name').valid?, 'Should be created if name is valid'
  end
end
