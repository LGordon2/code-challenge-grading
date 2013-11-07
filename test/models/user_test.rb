require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should be able to create user" do
    user = User.new
    user.username = "test.lew@orasi.com"
    assert user.save
  end
  
  test "should be valid orasi email" do
    user = User.new
    user.username = "test2@orasi.com"
    assert !user.save
    user.username = "test2@gmail.com"
    assert !user.save
    user.username = "test.lew@gmail.com"
    assert !user.save
  end
  
  test "should not be able to create user without username" do
    user = User.new
    assert !user.save
  end
end
