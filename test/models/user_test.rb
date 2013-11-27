require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should be able to create user" do
    user = User.new
    user.username = "test.lew"
    assert user.save!
  end
  
  test "should not be able to create user without username" do
    user = User.new
    assert !user.save
  end
  
  test "self authenticate" do
    assert true
  end
end
