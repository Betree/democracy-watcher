require 'test_helper'

class PromiseSubjectTest < ActiveSupport::TestCase
  test 'Category cannot be something else that what is defined in the enum' do
    assert_raise(ArgumentError) { PromiseSubject.create(category: 'SURELY NOT A VALID CATEGORY !') }
  end
end
