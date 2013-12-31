require 'test_helper'

class ArchiveControllerTest < ActionController::TestCase
  test "should not get show if not logged in" do
    ["bronze","silver","gold"].each do |league_type|
      get :show, {league: league_type}
      assert_redirected_to :login
    end
  end
  
  test "should get show if logged in" do
    ["bronze","silver","gold"].each do |league_type|
      get :show, {league: league_type}, {user_id: users(:user).id}
      assert_response :success
    end
  end

end
