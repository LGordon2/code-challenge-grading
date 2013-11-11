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
  
  test "should get all submissions" do
    ['bronze','silver','gold'].each do |league|
      request.env['HTTP_REFERER']="/november/#{league}"
      get :all_submissions, nil, {user_id: users(:user).id}
      assert_response :success
    end
  end
end
