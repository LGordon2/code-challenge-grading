require 'test_helper'

class FibonacciControllerTest < ActionController::TestCase
  test "should get index if logged in" do
    get :index, nil, {user_id: users(:lew).id}
    assert_response :success
  end
  
  test "should not get index if not logged in" do
    get :index
    assert_redirected_to :login
  end

end
