require "test_helper"

class User::HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get user_homes_top_url
    assert_response :success
  end

  test "should get role" do
    get user_homes_role_url
    assert_response :success
  end
end
