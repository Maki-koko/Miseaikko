require "test_helper"

class Admin::NotesControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get admin_notes_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_notes_update_url
    assert_response :success
  end
end
