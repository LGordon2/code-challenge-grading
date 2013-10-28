require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test "should get login" do
    get :login
    assert_response :success
  end
  
  test "should be logged in" do
    get :index, session: {:user_id => User.first}
    assert_response :success
  end

end
