require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should be able to create user" do
    user = User.new
    user.username = "test.lew"
    user.first_name = "test"
    user.last_name = "lew"
    assert user.save
  end
  
  test "user must have a first name and last name" do
    user = User.new
    user.username = "testing.user"
    assert_raises ActiveRecord::RecordInvalid do
      user.save!
    end
    user.first_name = "testing"
    assert_raises ActiveRecord::RecordInvalid do
      user.save!
    end
    user.last_name = "user"
    assert_nothing_raised ActiveRecord::RecordInvalid do
      user.save!
    end
  end
  
  test "should not be able to create user without username" do
    user = User.new
    assert_raises ActiveRecord::RecordInvalid do
      user.save!
    end
  end
  
  test "self authenticate" do
    assert true
  end
end
