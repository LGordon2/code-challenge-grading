require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test "should get new_user" do
    get :new_user
    assert_response :success
  end

end
