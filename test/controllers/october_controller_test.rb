require 'test_helper'

class OctoberControllerTest < ActionController::TestCase
  test "should get bronze" do
    get :bronze
    assert_response :success
  end

  test "should get silver" do
    get :silver
    assert_response :success
  end

  test "should get gold" do
    get :gold
    assert_response :success
  end

end
