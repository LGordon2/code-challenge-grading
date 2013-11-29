require 'test_helper'

class ArchiveControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

end
