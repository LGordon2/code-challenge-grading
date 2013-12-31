require 'test_helper'

class ChallengeControllerTest < ActionController::TestCase
  test "should not get index if not logged in" do
    ["June","July","August","September","October","November"].each do |month_name|
      ["Bronze","Silver","Gold"].each do |league_type|
        get :index, {month: month_name, league: league_type, year: 2013}
        assert_redirected_to :login
      end
    end
  end
  
  test "should get index if logged in" do
    get :index, {month: "november", league: "bronze", year: 2013}, {user_id: users(:user).id}
    assert_response :success
    
    get :index, {month: "November", league: "bronze", year: 2013}, {user_id: users(:user).id}
    assert_response :success

    get :index, {month: "November", league: "Bronze", year: 2013}, {user_id: users(:user).id}
    assert_response :success

    get :index, {month: "november", league: "Bronze", year: 2013}, {user_id: users(:user).id}
    assert_response :success
  end
end
