require "test_helper"

class TagControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get tag_search_url
    assert_response :success
  end
end
