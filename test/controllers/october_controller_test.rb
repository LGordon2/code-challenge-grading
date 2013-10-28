require 'test_helper'

class OctoberControllerTest < ActionController::TestCase
  
  #User not logged in shouldn't be able to access the challenge pages.
  test "should get bronze" do
    get :bronze
    assert_response :found
  end

  test "should get silver" do
    get :silver
    assert_response :found
  end

  test "should get gold" do
    get :gold
    assert_response :found
  end

end
