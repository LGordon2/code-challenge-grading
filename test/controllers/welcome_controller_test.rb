require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test "should get login" do
    get :login
    assert_response :success
  end
  
  test "should not see index" do
    get :index
    assert_response :redirect
  end
  
  test "should be logged in" do
    get :index, nil, session: {:user_id => users(:lew).id}
    assert_response :success
  end

end
