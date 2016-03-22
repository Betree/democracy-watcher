require 'test_helper'

class PromiseTest < ActiveSupport::TestCase
  test 'Category cannot be something else that what is defined in the enum' do
    assert_raise(ArgumentError) { Promise.create(category: 'SURELY NOT A VALID CATEGORY !') }
  end

  test 'Category cannot be null nor empty' do
    assert_not Promise.create(category: nil).valid?
    assert_not Promise.create(category: '').valid?
  end
end
