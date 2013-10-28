require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should not get index" do
    get :index
    assert_response :redirect
  end

end
