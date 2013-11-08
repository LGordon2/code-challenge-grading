require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  test "can create if logged in" do
    @request.headers["HTTP_REFERER"] = 'welcome/index'
    post :create, {comment: {comment: 'test', month: 'october', league: 'silver'}}, {user_id: users(:user).id}
    assert_redirected_to 'welcome/index'
  end
end
