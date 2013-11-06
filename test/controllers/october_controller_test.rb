require 'test_helper'

class OctoberControllerTest < ActionController::TestCase
  
  #User not logged in shouldn't be able to access the challenge pages.
  test "should get bronze" do
    get :bronze
    assert_response :redirect
  end

  test "should get silver" do
    get :silver
    assert_response :found
  end

  test "should get gold" do
    get :gold
    assert_response :found
  end
  
  test "should get bronze if logged in" do
    get :bronze, nil, {'user_id' => users(:user).id}
    assert_nil flash[:error]
    assert_response :success
  end
  
  test "should get silver if logged in" do
    get :silver, nil, {'user_id' => users(:user).id}
    assert_nil flash[:error]
    assert_response :success
  end
  
  test "should get gold if logged in" do
    get :gold, nil, {'user_id' => users(:user).id}
    assert_nil flash[:error]
    assert_response :success
  end

end
