require "test_helper"

class Pbblic::CommentControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get pbblic_comment_create_url
    assert_response :success
  end
end
