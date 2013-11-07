require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should be able to create user" do
    user = User.new
    user.save
  end
end
