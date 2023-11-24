require "test_helper"

class User::CommentControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get user_comment_create_url
    assert_response :success
  end

  test "should get destroy" do
    get user_comment_destroy_url
    assert_response :success
  end
end
