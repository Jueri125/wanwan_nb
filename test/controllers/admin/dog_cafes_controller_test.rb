require "test_helper"

class Admin::DogCafesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_dog_cafes_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_dog_cafes_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_dog_cafes_create_url
    assert_response :success
  end

  test "should get show" do
    get admin_dog_cafes_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_dog_cafes_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_dog_cafes_update_url
    assert_response :success
  end
end
