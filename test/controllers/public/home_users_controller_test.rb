require "test_helper"

class Public::HomeUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get public_home_users_top_url
    assert_response :success
  end
end
