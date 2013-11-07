require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test "should get login" do
    get :login
    assert_response :success
  end
  
  test "should not see index" do
    get :index
    assert_response :redirect
    assert_not_nil flash[:error]
  end
  
  test "should be logged in and see index" do
    get :index, nil, {'user_id' => users(:lew).id}
    assert_response :success
    assert_nil flash[:error]
  end
end
