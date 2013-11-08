require 'test_helper'

class NovemberControllerTest < ActionController::TestCase
  test "should get bronze if logged in" do
    get :bronze, nil, {user_id: users(:user).id}
    assert_response :success
  end

  test "should get silver if logged in" do
    get :silver, nil, {user_id: users(:user).id}
    assert_response :success
  end

  test "should get gold if logged in" do
    get :gold, nil, {user_id: users(:user).id}
    assert_response :success
  end

end
