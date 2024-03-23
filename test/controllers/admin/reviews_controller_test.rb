require "test_helper"

class Admin::ReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_reviews_new_url
    assert_response :success
  end
end
