require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test "should get login" do
    get :login
    assert_response :success
  end
  
  test "should not see index" do
    get :index
    assert_redirected_to :login
  end
  
  test "should be logged in and see index" do
    get :index, nil, {'user_id' => users(:lew).id}
    assert_response :success
    assert_nil flash[:error]
  end
  
  test "should not get error on index" do
    get :index
    assert_nil flash[:error]
  end
end
