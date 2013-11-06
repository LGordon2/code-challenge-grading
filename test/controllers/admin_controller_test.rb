require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should not get index" do
    get :index
    assert_response :redirect
  end
  
  test "shoult not get index if not admin" do
    get :index, nil, {:user_id => users(:user).id}
    assert_response :redirect
  end
  
  test "should get index" do
    get :index, nil, session = {:user_id => users(:admin).id}
    assert_response :success
  end

end
