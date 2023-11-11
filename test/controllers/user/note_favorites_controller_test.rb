require "test_helper"

class User::NoteFavoritesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get user_note_favorites_create_url
    assert_response :success
  end

  test "should get destroy" do
    get user_note_favorites_destroy_url
    assert_response :success
  end
end
