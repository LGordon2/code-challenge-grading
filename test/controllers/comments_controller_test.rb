require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  test "can create if logged in" do
    post(:create, paramify_values({comment: 'test'}), {user_id: users(:user).id})
    assert_response :found
  end
end
