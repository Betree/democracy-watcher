require 'test_helper'

class PromiseTest < ActiveSupport::TestCase
  test 'Subject cannot be null nor empty' do
    assert_not Promise.create(subject: nil).valid?
  end

  test 'Status cannot be null nor empty' do
    assert_not Promise.create(status: nil).valid?
    assert_not Promise.create(status: '').valid?
  end
end
