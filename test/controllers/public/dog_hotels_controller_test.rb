require "test_helper"

class Public::DogHotelsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_dog_hotels_index_url
    assert_response :success
  end

  test "should get show" do
    get public_dog_hotels_show_url
    assert_response :success
  end
end
