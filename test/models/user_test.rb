require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should not save user without email" do
    user = User.new
    assert_not user.save, "Saved the User without an email address"
  end
  test "should not save user with email" do
    user = User.new(email: 'text@example.com')
    assert user.save, "Saved the User with an email address"
  end
  test "the truth" do
    assert true
  end
end
