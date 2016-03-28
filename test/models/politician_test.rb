require 'test_helper'

class PoliticianTest < ActiveSupport::TestCase
  test 'Politicians should always have a name and it should not be empty' do
    assert_not  Politician.create(name: nil).valid?, 'Should not be created with an nil name'
    assert_not  Politician.create(name: '').valid?, 'Should not be created with an empty name'
    assert_not  Politician.create(name: ' ').valid?, 'Should not be created with only spaces for the name'
    assert      Politician.create(name: 'A decent name').valid?, 'Should be created if name is valid'
  end
end
