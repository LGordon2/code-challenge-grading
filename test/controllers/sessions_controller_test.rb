require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should not validate against AD" do
    post :create, {username: "lewis.gordon@orasi.com",password: ""}
    assert_response :redirect
  end
  
  test "should not validate against AD with invalid password" do
    post :create, {username: "lewis.gordon@orasi.com",password: "tesatesatsefaef"}
    assert_response :redirect
  end
end
