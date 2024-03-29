require "test_helper"

class Admin::DogHotelsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_dog_hotels_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_dog_hotels_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_dog_hotels_create_url
    assert_response :success
  end

  test "should get show" do
    get admin_dog_hotels_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_dog_hotels_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_dog_hotels_update_url
    assert_response :success
  end
end
