require "test_helper"

class Admin::DogEvetsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_dog_evets_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_dog_evets_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_dog_evets_create_url
    assert_response :success
  end

  test "should get show" do
    get admin_dog_evets_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_dog_evets_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_dog_evets_update_url
    assert_response :success
  end
end
