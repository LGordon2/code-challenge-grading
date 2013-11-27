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
  
  test "login password must not be blank" do
    post :validate_login, user: {username: "test.user", password: ""}
    assert_redirected_to :login
    assert_not_nil flash[:error]
  end
  
  test "picture not created if not connected to AD" do
    post :validate_login, user: {username: "testing.rails", password: "test"}
    assert_redirected_to :root
    assert_nil flash[:error]
  end
  
  test "login requires user param" do
    assert_raises ActionController::ParameterMissing do
      post :validate_login
    end
  end
end
