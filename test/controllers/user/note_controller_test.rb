require "test_helper"

class User::NoteControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_note_new_url
    assert_response :success
  end

  test "should get create" do
    get user_note_create_url
    assert_response :success
  end

  test "should get show" do
    get user_note_show_url
    assert_response :success
  end

  test "should get edit" do
    get user_note_edit_url
    assert_response :success
  end

  test "should get update" do
    get user_note_update_url
    assert_response :success
  end

  test "should get destroy" do
    get user_note_destroy_url
    assert_response :success
  end
end
