require "test_helper"

class Admin::RecordsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get admin_records_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_records_update_url
    assert_response :success
  end
end
